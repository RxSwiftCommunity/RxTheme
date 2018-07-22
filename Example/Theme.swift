//
//  Theme.swift
//  RxTheme_Example
//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//


#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
    typealias Color = UIColor
#endif
#if os(macOS)
    import Cocoa
    typealias Color = NSColor
#endif
import RxTheme


protocol Theme {
    var backgroundColor: Color { get }
    var textColor: Color { get }
}

struct LightTheme: Theme {
    let backgroundColor = Color.white
    let textColor = Color.black
}

struct DarkTheme: Theme {
    let backgroundColor = Color.black
    let textColor = Color.white
}

enum ThemeType: ThemeProvider {
    case light, dark
    var associatedObject: Theme {
        switch self {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        }
    }
}

let themeService = ThemeType.service(initial: .light)
