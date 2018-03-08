//
//  Theme.swift
//  RxTheme_Example
//
//  Created by 闻端 on 2018/3/7.
//  Copyright © 2018年 CocoaPods. All rights reserved.
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

let themeService = ThemeService<Theme>(themes: [LightTheme(), DarkTheme()])

