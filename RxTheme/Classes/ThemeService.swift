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
    public func attrStream<U>(_ mapper: @escaping ((Provider.T) -> U)) -> Observable<U> {
        return attrsStream.map(mapper)
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


