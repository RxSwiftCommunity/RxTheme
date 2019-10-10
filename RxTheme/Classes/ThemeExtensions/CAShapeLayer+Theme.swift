//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)


import RxSwift
import RxCocoa


public extension ThemeProxy where Base: CAShapeLayer {

    /// (set only) bind a stream to strokeColor
    var strokeColor: ThemeSignal<CGColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.strokeColor))
            hold(disposable, for: "strokeColor")
        }
    }

    /// (set only) bind a stream to fillColor
    var fillColor: ThemeSignal<CGColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.fillColor))
            hold(disposable, for: "fillColor")
        }
    }

}
#endif
