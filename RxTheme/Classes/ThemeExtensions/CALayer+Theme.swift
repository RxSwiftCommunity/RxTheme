//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)


import RxSwift
import RxCocoa


public extension ThemeProxy where Base: CALayer {

    /// (set only) bind a stream to backgroundColor
    var backgroundColor: ThemeSignal<CGColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.backgroundColor))
            hold(disposable, for: "backgroundColor")
        }
    }

    /// (set only) bind a stream to borderWidth
    var borderWidth: ThemeSignal<CGFloat> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.borderWidth))
            hold(disposable, for: "borderWidth")
        }
    }

    /// (set only) bind a stream to borderColor
    var borderColor: ThemeSignal<CGColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.borderColor))
            hold(disposable, for: "borderColor")
        }
    }

    /// (set only) bind a stream to shadowColor
    var shadowColor: ThemeSignal<CGColor?> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.shadowColor))
            hold(disposable, for: "shadowColor")
        }
    }

}
#endif
