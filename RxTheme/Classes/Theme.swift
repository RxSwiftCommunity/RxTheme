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
    private let relay: BehaviorRelay<Provider>
    private var cache = [Provider: Provider.T]()
    private func getAssociatedObject(_ key: Provider) -> Provider.T {
        if let cached = cache[key] { return cached }
        let object = key.associatedObject
        cache[key] = object
        return object
    }
    /// Current theme type
    public var type: Provider { return self.relay.value }
    /// Current theme attributes
    public var attrs: Provider.T { return self.getAssociatedObject(self.type) }
    /// Theme type stream
    public var typeStream: Observable<Provider> {
        return relay.asObservable()
    }
    /// Theme attributes stream
    public var attrsStream: Observable<Provider.T> {
        return relay.map { [unowned self] in self.getAssociatedObject($0) }
    }
    /// Update theme type
    public func `switch`(_ theme: Provider) {
        self.relay.accept(theme)
    }
    /// Bindable sink for theme switch
    public var switcher: Binder<Provider> {
        return Binder(self) { obj, attr in
            obj.switch(attr)
        }
    }
    /// Start binding
    public var rx: ThemeBindable<Provider.T> {
        return ThemeBindable(relay: attrsStream)
    }
}

public class ThemeBindable<T> {
    private let relay: Observable<T>
    private var disposables: [Disposable]

    fileprivate init(relay: Observable<T>) {
        self.relay = relay
        self.disposables = []
    }

    /// Bind theme attributes to UI attributes
    @discardableResult
    public func bind<U>(_ from: @escaping ((T) -> U), until: Observable<()>? = nil,
                        to binders: [Binder<U>]) -> ThemeBindable {
        if let until = until {
            disposables += binders.map {
                self.relay.map(from)
                    .takeUntil(until)
                    .observeOn(MainScheduler.instance)
                    .bind(to: $0)
            }
        } else {
            disposables += binders.map {
                self.relay.map(from)
                    .observeOn(MainScheduler.instance)
                    .bind(to: $0)
            }
        }
        return self
    }

    /// Bind theme attributes to UI attributes
    @discardableResult
    public func bind<U>(_ from: @escaping ((T) -> U), until: Observable<()>? = nil,
                        to binders: Binder<U>...) -> ThemeBindable {
        return self.bind(from, until: until, to: binders)
    }

    /// Add self to bag
    public func disposed(by disposeBag: DisposeBag) {
        CompositeDisposable(disposables: disposables).disposed(by: disposeBag)
    }
}
