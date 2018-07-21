//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import XCTest
import UIKit
import RxSwift
import RxTheme

class Tests: XCTestCase {

    let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSwitchTheme() {
        let label = UILabel()
        themeService.bind({ $0.textColor }, to: label.rx.textColor)
            .disposed(by: disposeBag)
        XCTAssertEqual(label.textColor, MDTheme.light.textColor)
        themeService.set(theme: .dark)
        XCTAssertEqual(label.textColor, MDTheme.dark.textColor)
    }
    
    func testSwitchThemewithIndex() {
        let label = UILabel()
        themeService.set(index: MDTheme.light.rawValue)
        themeService.bind({ $0.textColor }, to: label.rx.textColor)
            .disposed(by: disposeBag)
        XCTAssertEqual(label.textColor, MDTheme.light.textColor)
        themeService.set(index: MDTheme.dark.rawValue)
        XCTAssertEqual(label.textColor, MDTheme.dark.textColor)
    }
    
    func testGetAllThemes() {
        let allThemes = themeService.allThemes
        XCTAssertEqual(allThemes,MDTheme.allCases.map{$0})
    }

    func testGetAllThemeNames() {
        let allNames = themeService.allThemeNames
        XCTAssertEqual(allNames,MDTheme.allCases.map{$0.description})
    }

}
