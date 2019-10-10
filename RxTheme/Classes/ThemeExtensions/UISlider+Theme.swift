//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UISlider {

    /// (set only) bind a stream to thumbTintColor
    var thumbTintColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.thumbTintColor))
            hold(disposable, for: "thumbTintColor")
        }
    }

    /// (set only) bind a stream to minimumTrackTintColor
    var minimumTrackTintColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.minimumTrackTintColor))
            hold(disposable, for: "minimumTrackTintColor")
        }
    }

    /// (set only) bind a stream to maximumTrackTintColor
    var maximumTrackTintColor: ThemeSignal<UIColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.maximumTrackTintColor))
            hold(disposable, for: "maximumTrackTintColor")
        }
    }

}
#endif
