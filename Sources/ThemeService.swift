//
//  ThemeService.swift
//
//  Created by duan on 2019/01/22.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


public class ThemeService<Provider: ThemeProvider>: NSObject {
    init(initial: Provider) {
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

    /// Theme type stream
    public var typeStream: Observable<Provider> {
        return relay.asObservable()
    }

    /// Current theme attributes
    public func attribute<U>(_ mapper: @escaping ((Provider.T) -> U)) -> ThemeAttribute<U> {
        return ThemeAttribute(
            value: mapper(self.getAssociatedObject(self.type)),
            stream: relay.map { [unowned self] in self.getAssociatedObject($0) }.map(mapper)
        )
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
}


