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
        self.behavior = BehaviorRelay<Provider>(value: initial)
    }
    private let behavior: BehaviorRelay<Provider>
    private var cache = [Provider: Provider.T]()
    private func getAssociatedObject(_ key: Provider) -> Provider.T {
        if let cached = cache[key] { return cached }
        let object = key.associatedObject
        cache[key] = object
        return object
    }

    /// Current theme type
    public var type: Provider { return self.behavior.value }

    /// Current theme attributes
    public var attrs: Provider.T { return self.getAssociatedObject(self.type) }

    /// Theme type stream
    public var typeStream: ThemeSignal<Provider> {
        return behavior.asThemeSignal()
    }

    /// Theme attributes stream
    public var attrsStream: ThemeSignal<Provider.T> {
        return behavior.asThemeSignal().map { [unowned self] in self.getAssociatedObject($0) }
    }

    /// Theme attribute stream for mapper
    public func attrStream<U>(_ mapper: @escaping ((Provider.T) -> U)) -> ThemeSignal<U> {
        return attrsStream.map(mapper)
    }

    /// Update theme type
    public func `switch`(_ theme: Provider) {
        self.behavior.accept(theme)
    }

    /// Bindable sink for theme switch
    public var switcher: Binder<Provider> {
        return Binder(self) { obj, attr in
            obj.switch(attr)
        }
    }

    /// Start chainable binding
    public var rx: ThemeBindable<Provider.T> {
        return ThemeBindable(signal: behavior.asThemeSignal().map(getAssociatedObject))
    }
}

private extension BehaviorRelay {
    func asThemeSignal() -> ThemeSignal<Element> {
        ThemeSignal(value: value, onChange: skip(1))
    }
}
