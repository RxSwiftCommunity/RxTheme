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
    var pageIndicatorTintColor: ThemeAttribute<UIColor?> {
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.pageIndicatorTintColor = value
            }
            let disposable = newValue.steam
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.pageIndicatorTintColor)
            hold(disposable, for: "pageIndicatorTintColor")
        }
    }

    /// (set only) bind a stream to currentPageIndicatorTintColor
    var currentPageIndicatorTintColor: ThemeAttribute<UIColor?> {
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.currentPageIndicatorTintColor = value
            }
            let disposable = newValue.steam
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.currentPageIndicatorTintColor)
            hold(disposable, for: "currentPageIndicatorTintColor")
        }
    }

}
#endif
