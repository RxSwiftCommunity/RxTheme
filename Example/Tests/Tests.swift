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
        // This is an example of a functional test case.
        let label = UILabel()
        themeService.rx
            .bind({ $0.textColor }, to: label.rx.textColor)
            .disposed(by: disposeBag)
        XCTAssertEqual(label.textColor, LightTheme().textColor)
        themeService.set(.dark)
        XCTAssertEqual(label.textColor, DarkTheme().textColor)
    }

}
