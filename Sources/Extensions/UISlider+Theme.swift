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
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.thumbTintColor = value
            }
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.thumbTintColor)
            hold(disposable, for: "thumbTintColor")
        }
    }

    /// (set only) bind a stream to minimumTrackTintColor
    var minimumTrackTintColor: ThemeAttribute<UIColor?> {
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.minimumTrackTintColor = value
            }
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.minimumTrackTintColor)
            hold(disposable, for: "minimumTrackTintColor")
        }
    }

    /// (set only) bind a stream to maximumTrackTintColor
    var maximumTrackTintColor: ThemeAttribute<UIColor?> {
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.maximumTrackTintColor = value
            }
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.maximumTrackTintColor)
            hold(disposable, for: "maximumTrackTintColor")
        }
    }

}
#endif
