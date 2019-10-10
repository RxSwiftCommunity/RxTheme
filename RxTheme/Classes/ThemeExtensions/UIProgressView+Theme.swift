//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UIProgressView {

    /// (set only) bind a stream to progressTintColor
    var progressTintColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.progressTintColor))
            hold(disposable, for: "progressTintColor")
        }
    }

    /// (set only) bind a stream to trackTintColor
    var trackTintColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.trackTintColor))
            hold(disposable, for: "trackTintColor")
        }
    }

}
#endif
