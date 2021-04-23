//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UIToolbar {

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
            base.barTintColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.barTintColor)
            hold(disposable, for: "barTintColor")
        }
    }

}
#endif
