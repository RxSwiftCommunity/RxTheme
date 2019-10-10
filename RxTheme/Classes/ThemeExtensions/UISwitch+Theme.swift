//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UISwitch {

    /// (set only) bind a stream to onTintColor
    var onTintColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.onTintColor))
            hold(disposable, for: "onTintColor")
        }
    }

    /// (set only) bind a stream to thumbTintColor
    var thumbTintColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.thumbTintColor))
            hold(disposable, for: "thumbTintColor")
        }
    }

}
#endif
