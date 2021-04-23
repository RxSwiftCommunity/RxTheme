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
    var thumbTintColor: ThemeAttribute<UIColor?> {
        get { fatalError("set only") }
        set {
            base.thumbTintColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.thumbTintColor)
            hold(disposable, for: "thumbTintColor")
        }
    }

    /// (set only) bind a stream to minimumTrackTintColor
    var minimumTrackTintColor: ThemeAttribute<UIColor?> {
        get { fatalError("set only") }
        set {
            base.minimumTrackTintColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.minimumTrackTintColor)
            hold(disposable, for: "minimumTrackTintColor")
        }
    }

    /// (set only) bind a stream to maximumTrackTintColor
    var maximumTrackTintColor: ThemeAttribute<UIColor?> {
        get { fatalError("set only") }
        set {
            base.maximumTrackTintColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.maximumTrackTintColor)
            hold(disposable, for: "maximumTrackTintColor")
        }
    }

}
#endif
