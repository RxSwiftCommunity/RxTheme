//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)


import QuartzCore
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: CALayer {

    /// (set only) bind a stream to backgroundColor
    var backgroundColor: ThemeAttribute<CGColor?> {
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.backgroundColor = value
            }
            let disposable = newValue.steam
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.backgroundColor)
            hold(disposable, for: "backgroundColor")
        }
    }

    /// (set only) bind a stream to borderWidth
    var borderWidth: ThemeAttribute<CGFloat> {
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.borderWidth = value
            }
            let disposable = newValue.steam
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.borderWidth)
            hold(disposable, for: "borderWidth")
        }
    }

    /// (set only) bind a stream to borderColor
    var borderColor: ThemeAttribute<CGColor?> {
        get { return ThemeAttribute() }
        set {
            if let value = newValue.value {
                base.borderColor = value
            }
            let disposable = newValue.steam
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.borderColor)
            hold(disposable, for: "borderColor")
        }
    }

    /// (set only) bind a stream to shadowColor
    var shadowColor: ThemeAttribute<CGColor?> {
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.shadowColor = value
            }
            let disposable = newValue.steam
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.shadowColor)
            hold(disposable, for: "shadowColor")
        }
    }

}
#endif
