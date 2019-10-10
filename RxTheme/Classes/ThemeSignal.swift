//
//  ThemeSignal.swift
//  Pods
//
//  Created by duan on 2019/10/10.
//

import Foundation
import RxSwift

public class ThemeSignal<A> {
    public let value: A
    public let onChange: Observable<A>
    public var behavior: Observable<A> {
        onChange.startWith(value)
    }

    public init(value: A, onChange: Observable<A>) {
        self.value = value
        self.onChange = onChange
    }

    public func map<B>(_ f: @escaping (A) -> B) -> ThemeSignal<B> {
        ThemeSignal<B>(value: f(value), onChange: onChange.map(f))
    }

    public func bind(to binder: ThemeBinder<A>) -> Disposable {
        binder.setter(value)
        return onChange
            .observeOn(MainScheduler.instance)
            .bind(onNext: binder.setter)
    }
}

public extension ThemeSignal {
    func asOptional() -> ThemeSignal<A?> {
        map { $0 as A? }
    }
}
