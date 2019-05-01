//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)


import RxSwift
import RxCocoa


public extension ThemeProxy where Base: CAShapeLayer {

    /// (set only) bind a stream to strokeColor
    var strokeColor: Observable<CGColor?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.strokeColor)
            hold(disposable, for: "strokeColor")
        }
    }

    /// (set only) bind a stream to fillColor
    var fillColor: Observable<CGColor?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.fillColor)
            hold(disposable, for: "fillColor")
        }
    }

}
#endif
