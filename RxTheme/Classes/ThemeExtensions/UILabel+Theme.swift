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
    var font: ThemeSignal<UIFont> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.font))
            hold(disposable, for: "font")
        }
    }

    /// (set only) bind a stream to textColor
    var textColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.textColor))
            hold(disposable, for: "textColor")
        }
    }

    /// (set only) bind a stream to highlightedTextColor
    var highlightedTextColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.highlightedTextColor))
            hold(disposable, for: "highlightedTextColor")
        }
    }

    /// (set only) bind a stream to shadowColor
    var shadowColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.shadowColor))
            hold(disposable, for: "shadowColor")
        }
    }

}
#endif
