//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UINavigationBar {

    /// (set only) bind a stream to barStyle
    var barStyle: Observable<UIBarStyle> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.barStyle)
            hold(disposable, for: "barStyle")
        }
    }

    /// (set only) bind a stream to barTintColor
    var barTintColor: Observable<UIColor?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.barTintColor)
            hold(disposable, for: "barTintColor")
        }
    }

    /// (set only) bind a stream to titleTextAttributes
    var titleTextAttributes: Observable<[NSAttributedString.Key: Any]?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.titleTextAttributes)
            hold(disposable, for: "titleTextAttributes")
        }
    }

    /// (set only) bind a stream to largeTitleTextAttributes
    @available(iOS, introduced:11.0)
    var largeTitleTextAttributes: Observable<[NSAttributedString.Key: Any]?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.largeTitleTextAttributes)
            hold(disposable, for: "largeTitleTextAttributes")
        }
    }

}
#endif
