//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import RxSwift
import RxCocoa

// todo: better implementation when Swift releases more generic Enum
public protocol ThemeProvider: Hashable {
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
    private var cache = [Provider: Provider.T]()
    private func getAssociatedObject(_ key: Provider) -> Provider.T {
        if let cached = cache[key] { return cached }
        let object = key.associatedObject
        cache[key] = object
        return object
    }
    /// BehaviorRelay for theme
    public let relay: BehaviorRelay<Provider>
    /// Current theme
    public var theme: Provider { return self.relay.value }
    /// Current theme object
    public var themeObject: Provider.T { return self.getAssociatedObject(self.theme) }
    /// Set theme
    public func set(_ theme: Provider) {
        self.relay.accept(theme)
    }
    /// Start binding
    public var rx: ThemeBindable<Provider.T> {
        let targetRelay = self.relay.map {
            self.getAssociatedObject($0)
        }
        return ThemeBindable(relay: targetRelay)
    }
}

public class ThemeBindable<T> {
    private let relay: Observable<T>
    private var disposables: [Disposable]

    fileprivate init(relay: Observable<T>) {
        self.relay = relay
        self.disposables = []
    }

    /// Bind theme component to UI attributes
    public func bind<U>(_ from: @escaping ((T) -> U), to binders: [Binder<U>]) -> ThemeBindable {
        disposables += binders.map {
            self.relay.map(from)
                .observeOn(MainScheduler.instance)
                .bind(to: $0)
        }
        return self
    }

    /// Bind theme component to UI attributes
    public func bind<U>(_ from: @escaping ((T) -> U), to binders: Binder<U>...) -> ThemeBindable {
        return self.bind(from, to: binders)
    }

    /// Add self to bag
    public func disposed(by disposeBag: DisposeBag) {
        CompositeDisposable(disposables: disposables).disposed(by: disposeBag)
    }
}
