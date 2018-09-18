//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import RxSwift
import RxCocoa

public protocol ThemeProvider {
    associatedtype T
    var associatedObject: T { get }
}

public extension ThemeProvider {
    /// Generate ThemeService
    public static func service(initial: Self) -> ThemeService<Self> {
        return ThemeService(initial: initial)
    }
}

public class ThemeService<T: ThemeProvider>: NSObject {
    fileprivate init(initial: T) {
        self.relay = BehaviorRelay<T>(value: initial)
    }

    /// BehaviorRelay for theme
    public let relay: BehaviorRelay<T>

    /// Current theme
    public var theme: T { return self.relay.value }

    /// Current theme object
    public var themeObject: T.T { return self.theme.associatedObject }

    /// Set current theme
    public func set(_ theme: T) {
        self.relay.accept(theme)
    }

    public var rx: ThemeBindable<T> {
        return ThemeBindable<T>(relay: self.relay)
    }

    // todo: random and next method in Swift4.2 with CaseIterable
}

public class ThemeBindable<T: ThemeProvider> {
    private let relay: BehaviorRelay<T>
    private var disposables: [Disposable]

    fileprivate init(relay: BehaviorRelay<T>) {
        self.relay = relay
        self.disposables = []
    }

    /// Bind theme component to UI attributes
    // todo: avoid writing T.T
    public func bind<U>(_ from: @escaping ((T.T) -> U), to binders: [Binder<U>]) -> ThemeBindable {
        disposables += binders.map {
            // todo: put $0.associatedObject to ThemeService
            self.relay.map { $0.associatedObject }.map(from)
                .observeOn(MainScheduler.instance)
                .bind(to: $0)
        }
        return self
    }

    /// Bind theme component to UI attributes
    public func bind<U>(_ from: @escaping ((T.T) -> U), to binders: Binder<U>...) -> ThemeBindable {
        return self.bind(from, to: binders)
    }

    /// Add self to bag
    public func disposed(by disposeBag: DisposeBag) {
        CompositeDisposable(disposables: disposables).disposed(by: disposeBag)
    }
}
