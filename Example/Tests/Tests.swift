//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import XCTest
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
typealias Color = UIColor
#endif
#if os(macOS)
import Cocoa
typealias Color = NSColor
#endif
import RxSwift
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
        case .light: return LightTheme()
        case .dark: return DarkTheme()
        }
    }
}

class Tests: XCTestCase {

    var disposeBag: DisposeBag!
    var themeService: ThemeService<ThemeType>!

    override func setUp() {
        super.setUp()
        self.disposeBag = DisposeBag()
        self.themeService = ThemeType.service(initial: .light)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSingleBind() {
        let label = UILabel()
        label.theme.textColor = themeService.attribute { $0.textColor }
        XCTAssertEqual(label.textColor, LightTheme().textColor)
        themeService.switch(.dark)
        XCTAssertEqual(label.textColor, DarkTheme().textColor)
    }

    func testMultiBind() {
        let label1 = UILabel()
        let label2 = UILabel()

        label1.theme.textColor = themeService.attribute { $0.textColor }
        label2.theme.textColor = themeService.attribute { $0.textColor }
        XCTAssertEqual(label1.textColor, LightTheme().textColor)
        XCTAssertEqual(label2.textColor, LightTheme().textColor)
        themeService.switch(.dark)
        XCTAssertEqual(label1.textColor, DarkTheme().textColor)
        XCTAssertEqual(label2.textColor, DarkTheme().textColor)
    }

    func testOverrideBind() {
        let label = UILabel()
        label.theme.textColor = themeService.attribute { $0.backgroundColor }
        XCTAssertEqual(label.textColor, LightTheme().backgroundColor)
        label.theme.textColor = themeService.attribute { $0.textColor }
        XCTAssertEqual(label.textColor, LightTheme().textColor)
        themeService.switch(.dark)
        XCTAssertEqual(label.textColor, DarkTheme().textColor)
    }
}
