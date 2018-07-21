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


enum MDTheme:Int,CaseIterable,CustomStringConvertible {
    case light
    case dark
    case green
    case orange
    
    var description: String {
        switch self {
        case .light:
            return "Light Theme"
        case .dark:
            return "Dark Theme"
        case .green:
            return "Green Theme"
        case .orange:
            return "Orange Theme"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .light:
            return .white
        case .dark:
            return .black
        case .green:
            return .green
        case .orange:
            return .orange
        }
    }
    
    var textColor: Color {
        switch self {
        case .light:
            return .black
        case .dark:
            return .white
        case .green:
            return .brown
        case .orange:
            return .blue
        }
    }
}

let themeService = ThemeService(theme: MDTheme.light)
