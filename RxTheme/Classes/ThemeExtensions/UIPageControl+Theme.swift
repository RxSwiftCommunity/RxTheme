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
    var pageIndicatorTintColor: Observable<UIColor?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.pageIndicatorTintColor)
            hold(disposable, for: "pageIndicatorTintColor")
        }
    }

    /// (set only) bind a stream to currentPageIndicatorTintColor
    var currentPageIndicatorTintColor: Observable<UIColor?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.currentPageIndicatorTintColor)
            hold(disposable, for: "currentPageIndicatorTintColor")
        }
    }

}
#endif
