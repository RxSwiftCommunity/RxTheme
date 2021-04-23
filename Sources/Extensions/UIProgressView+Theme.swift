//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UIProgressView {

    /// (set only) bind a stream to progressTintColor
    var progressTintColor: ThemeAttribute<UIColor?> {
        get { fatalError("set only") }
        set {
            base.progressTintColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.progressTintColor)
            hold(disposable, for: "progressTintColor")
        }
    }

    /// (set only) bind a stream to trackTintColor
    var trackTintColor: ThemeAttribute<UIColor?> {
        get { fatalError("set only") }
        set {
            base.trackTintColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.trackTintColor)
            hold(disposable, for: "trackTintColor")
        }
    }

}
#endif
