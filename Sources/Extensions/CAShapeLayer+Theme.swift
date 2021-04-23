//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)


import QuartzCore
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: CAShapeLayer {

    /// (set only) bind a stream to strokeColor
    var strokeColor: ThemeAttribute<CGColor?> {
        get { fatalError("set only") }
        set {
            base.strokeColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.strokeColor)
            hold(disposable, for: "strokeColor")
        }
    }

    /// (set only) bind a stream to fillColor
    var fillColor: ThemeAttribute<CGColor?> {
        get { fatalError("set only") }
        set {
            base.fillColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.fillColor)
            hold(disposable, for: "fillColor")
        }
    }

}
#endif
