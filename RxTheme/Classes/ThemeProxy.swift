//
//  ThemeProxy.swift
//
//  Created by duan on 2019/01/22.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import Foundation
import ObjectiveC
import RxSwift


public protocol ThemeCompatible {
    associatedtype CompatibleType
    var theme: ThemeProxy<CompatibleType> { get }
}

extension ThemeCompatible {
    public var theme: ThemeProxy<Self> { return ThemeProxy(self) }
}

extension NSObject: ThemeCompatible {}

private var ThemeProxyDisposablesHandle: UInt8 = 0

public class ThemeProxy<Base> {
    /// Base object to extend.
    public let base: Base

    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }

    /// Hold disposable for key, override if already exist
    public func hold(_ disposable: Disposable, for key: String) {
        let rv = disposables
        if let prev = rv[key] as? Disposable {
            prev.dispose()
        }
        rv[key] = disposable
        disposables = rv
    }

    private var disposables: NSMutableDictionary {
        get {
            let val = objc_getAssociatedObject(
                base, &ThemeProxyDisposablesHandle
                ) as? NSMutableDictionary
            return val ?? [:]
        }
        set {
            objc_setAssociatedObject(
                base, &ThemeProxyDisposablesHandle,
                newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}
