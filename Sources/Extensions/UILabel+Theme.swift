//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UILabel {

    /// (set only) bind a stream to font
    var font: ThemeAttribute<UIFont> {
        get { fatalError("set only") }
        set {
            base.font = newValue.value
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
            base.textColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.textColor)
            hold(disposable, for: "textColor")
        }
    }

    /// (set only) bind a stream to highlightedTextColor
    var highlightedTextColor: ThemeAttribute<UIColor?> {
        get { fatalError("set only") }
        set {
            base.highlightedTextColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.highlightedTextColor)
            hold(disposable, for: "highlightedTextColor")
        }
    }

    /// (set only) bind a stream to shadowColor
    var shadowColor: ThemeAttribute<UIColor?> {
        get { fatalError("set only") }
        set {
            base.shadowColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.shadowColor)
            hold(disposable, for: "shadowColor")
        }
    }

}
#endif
