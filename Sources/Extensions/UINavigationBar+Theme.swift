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
    var barStyle: ThemeAttribute<UIBarStyle> {
        get { fatalError("set only") }
        set {
            base.barStyle = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.barStyle)
            hold(disposable, for: "barStyle")
        }
    }

    /// (set only) bind a stream to barTintColor
    var barTintColor: ThemeAttribute<UIColor?> {
        get { fatalError("set only") }
        set {
            if let value = newValue.value {
                base.barTintColor = value
            }
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.barTintColor)
            hold(disposable, for: "barTintColor")
        }
    }

    /// (set only) bind a stream to titleTextAttributes
    var titleTextAttributes: ThemeAttribute<[NSAttributedString.Key: Any]?> {
        get { fatalError("set only") }
        set {
            base.titleTextAttributes = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.titleTextAttributes)
            hold(disposable, for: "titleTextAttributes")
        }
    }

    /// (set only) bind a stream to largeTitleTextAttributes
    @available(iOS 11.0, *)
    var largeTitleTextAttributes: ThemeAttribute<[NSAttributedString.Key: Any]?> {
        get { fatalError("set only") }
        set {
            base.largeTitleTextAttributes = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.largeTitleTextAttributes)
            hold(disposable, for: "largeTitleTextAttributes")
        }
    }

}
#endif
