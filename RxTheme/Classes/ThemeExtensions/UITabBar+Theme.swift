//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UITabBar {

    /// (set only) bind a stream to barStyle
    var barStyle: ThemeSignal<UIBarStyle> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.barStyle))
            hold(disposable, for: "barStyle")
        }
    }

    /// (set only) bind a stream to barTintColor
    var barTintColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.barTintColor))
            hold(disposable, for: "barTintColor")
        }
    }

}
#endif
