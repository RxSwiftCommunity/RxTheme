//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UIPageControl {

    /// (set only) bind a stream to pageIndicatorTintColor
    var pageIndicatorTintColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.pageIndicatorTintColor))
            hold(disposable, for: "pageIndicatorTintColor")
        }
    }

    /// (set only) bind a stream to currentPageIndicatorTintColor
    var currentPageIndicatorTintColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.currentPageIndicatorTintColor))
            hold(disposable, for: "currentPageIndicatorTintColor")
        }
    }

}
#endif
