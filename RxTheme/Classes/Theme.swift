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
    /// Generate Theme service
    public static func service(initial: Self) -> ThemeService<Self> {
        return ThemeService(initial: initial)
    }
}

public class ThemeService<Provider: ThemeProvider>: NSObject {
    fileprivate init(initial: Provider) {
        self.relay = BehaviorRelay<Provider>(value: initial)
    }
    /// BehaviorRelay for theme
    public let relay: BehaviorRelay<Provider>
    /// Current theme
    public var theme: Provider { return self.relay.value }
    /// Current theme object
    public var themeObject: Provider.T { return self.theme.associatedObject }
    /// Set theme
    public func set(_ theme: Provider) {
        self.relay.accept(theme)
    }
    /// Start binding
    public var rx: ThemeBindable<Provider> {
        return ThemeBindable<Provider>(relay: self.relay)
    }
}

public class ThemeBindable<Provider: ThemeProvider> {
    private let relay: BehaviorRelay<Provider>
    private var disposables: [Disposable]

    fileprivate init(relay: BehaviorRelay<Provider>) {
        self.relay = relay
        self.disposables = []
    }

    /// Bind theme component to UI attributes
    public func bind<U>(_ from: @escaping ((Provider.T) -> U), to binders: [Binder<U>]) -> ThemeBindable {
        disposables += binders.map {
            // todo: put $0.associatedObject to ThemeService
            self.relay.map { $0.associatedObject }.map(from)
                .observeOn(MainScheduler.instance)
                .bind(to: $0)
        }
        return self
    }

    /// Bind theme component to UI attributes
    public func bind<U>(_ from: @escaping ((Provider.T) -> U), to binders: Binder<U>...) -> ThemeBindable {
        return self.bind(from, to: binders)
    }

    /// Add self to bag
    public func disposed(by disposeBag: DisposeBag) {
        CompositeDisposable(disposables: disposables).disposed(by: disposeBag)
    }
}
