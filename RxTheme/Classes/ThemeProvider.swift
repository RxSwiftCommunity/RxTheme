//
//  ThemeProvider.swift
//
//  Created by duan on 2019/01/22.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import Foundation


// TODO: better implementation when Swift releases more generic Enum
public protocol ThemeProvider: Hashable {
    associatedtype T
    var associatedObject: T { get }
}

public extension ThemeProvider {
    /// Generate Theme service
    static func service(initial: Self) -> ThemeService<Self> {
        return ThemeService(initial: initial)
    }
}
