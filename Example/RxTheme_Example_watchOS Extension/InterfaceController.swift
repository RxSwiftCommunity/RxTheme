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

public extension ThemeProxy where Base: WKInterfaceLabel {
    /// (set only) bind a stream to barStyle
    var textColor: ThemeAttribute<UIColor?> {
        get { fatalError("set only") }
        set {
            base.setTextColor(newValue.value)
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.textColor)
            hold(disposable, for: "barStyle")
        }
    }
}

class InterfaceController: WKInterfaceController {

    @IBOutlet var label: WKInterfaceLabel!

    let disposeBag = DisposeBag()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        label.theme.textColor = themed { $0.textColor }
    }

    @IBAction func didPressSwitch() {
        themeService.switch(themeService.type == .dark ? .light : .dark)
    }
}
