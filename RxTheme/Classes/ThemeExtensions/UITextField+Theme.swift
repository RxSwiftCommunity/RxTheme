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
    public var font: Observable<UIFont?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.font)
            hold(disposable, for: "font")
        }
    }

    /// (set only) bind a stream to textColor
    public var textColor: Observable<UIColor?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.textColor)
            hold(disposable, for: "textColor")
        }
    }

    /// (set only) bind a stream to keyboardAppearance
    public var keyboardAppearance: Observable<UIKeyboardAppearance> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.keyboardAppearance)
            hold(disposable, for: "keyboardAppearance")
        }
    }

}
#endif
