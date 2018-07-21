//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import RxSwift
import RxCocoa

public protocol ThemeTypeCapable {
    associatedtype T
    var associatedObject: T { get }
}

public extension ThemeTypeCapable {
    static func service(initial: Self) -> ThemeService<Self> {
        return ThemeService(initial: initial)
    }
}

public class ThemeService<T: ThemeTypeCapable> {
    fileprivate init(initial: T) {
        self.relay = BehaviorRelay<T>(value: initial)
    }

    private func _bind<U>(_ from: @escaping ((T.T) -> U), to: Binder<U>) -> Disposable {
        return self.relay.map { $0.associatedObject }.map(from)
            .observeOn(MainScheduler.instance)
            .bind(to: to)
    }

    private func _bind<U>(_ from: @escaping ((T.T) -> U), to: [Binder<U>]) -> [Disposable] {
        return to.map { self._bind(from, to: $0) }
    }

    public let relay: BehaviorRelay<T>
    public var theme: T { return self.relay.value }
    public typealias bindSuit<U> = (((T.T) -> U), [Binder<U>])

    /// set current theme
    public func set(_ theme: T) {
        self.relay.accept(theme)
    }

    /// bind theme component to UI attributes
    public func bind<U>(_ from: @escaping ((T.T) -> U), to: [Binder<U>]) -> Disposable {
        return CompositeDisposable(disposables: _bind(from, to: to))
    }

    /// bind theme component to UI attributes
    public func bind<U>(_ from: @escaping ((T.T) -> U), to: Binder<U>...) -> Disposable {
        return CompositeDisposable(disposables: _bind(from, to: to))
    }

    /// bind bunch of stuff with same type at once
    public func bind<U>(_ suits: [bindSuit<U>]) -> Disposable {
        return CompositeDisposable.init(disposables: suits.map { self.bind($0, to: $1) })
    }
}
