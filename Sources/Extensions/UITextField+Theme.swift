//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UITextField {

    /// (set only) bind a stream to font
    var font: ThemeAttribute<UIFont?> {
        get { fatalError("set only") }
        set {
            if let value = newValue.value {
                base.font = value
            }
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.font)
            hold(disposable, for: "font")
        }
    }

    /// (set only) bind a stream to textColor
    var textColor: ThemeAttribute<UIColor?> {
        get { fatalError("set only") }
        set {
            if let value = newValue.value {
                base.textColor = value
            }
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.textColor)
            hold(disposable, for: "textColor")
        }
    }

    /// (set only) bind a stream to keyboardAppearance
    var keyboardAppearance: ThemeAttribute<UIKeyboardAppearance> {
        get { fatalError("set only") }
        set {
            base.keyboardAppearance = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.keyboardAppearance)
            hold(disposable, for: "keyboardAppearance")
        }
    }

}
#endif
