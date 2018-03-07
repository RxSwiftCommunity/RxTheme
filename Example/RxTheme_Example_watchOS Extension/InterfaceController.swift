//
//  InterfaceController.swift
//  RxTheme_Example_watchOS Extension
//
//  Created by 闻端 on 2018/3/8.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import WatchKit
import Foundation
import RxSwift
import RxCocoa
import RxTheme


public extension Reactive where Base: WKInterfaceLabel {
    /// Bindable sink for `backgroundColor` property
    public var textColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.setTextColor(attr)
        }
    }
}

class InterfaceController: WKInterfaceController {

    @IBOutlet var label: WKInterfaceLabel!

    let disposeBag = DisposeBag()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        themeService.bind({ $0.textColor }, to: label.rx.textColor)
            .disposed(by: disposeBag)
    }

    @IBAction func didPressSwitch() {
        themeService.set(index: themeService.index == 0 ? 1 : 0)
    }
}
