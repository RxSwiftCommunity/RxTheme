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
        themeService.rx
            .bind({ $0.textColor }, to: label.rx.textColor)
            .disposed(by: disposeBag)
        XCTAssertEqual(label.textColor, LightTheme().textColor)
        themeService.switch(.dark)
        XCTAssertEqual(label.textColor, DarkTheme().textColor)
    }

}
