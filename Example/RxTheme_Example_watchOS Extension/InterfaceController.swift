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


extension ThemeProxy where Base: WKInterfaceLabel {
    var binderForTextColor: ThemeBinder<UIColor?> {
        ThemeBinder(base, setter: { a, v in
            a.setTextColor(v)
        })
    }

    /// (set only) bind a stream to textColor
    var textColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: binderForTextColor)
            self.hold(disposable, for: "textColor")
        }
    }
}

class InterfaceController: WKInterfaceController {

    @IBOutlet var label: WKInterfaceLabel!

    let disposeBag = DisposeBag()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        themeService.rx
            .bind({ $0.textColor }, to: label.theme.binderForTextColor)
            .disposed(by: disposeBag)
    }

    @IBAction func didPressSwitch() {
        themeService.switch(themeService.type == .dark ? .light : .dark)
    }
}
