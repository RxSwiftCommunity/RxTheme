//
//  InterfaceController.swift
//  RxTheme_Example_watchOS Extension
//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import Foundation
import WatchKit
import RxSwift
import RxCocoa
import RxTheme


public extension Reactive where Base: WKInterfaceLabel {
    /// Bindable sink for `backgroundColor` property
    var textColor: Binder<UIColor?> {
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
        themeService.rx
            .bind({ $0.textColor }, to: label.rx.textColor)
            .disposed(by: disposeBag)
    }

    @IBAction func didPressSwitch() {
        themeService.switch(themeService.type == .dark ? .light : .dark)
    }
}
