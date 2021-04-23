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
    var onTintColor: ThemeAttribute<UIColor?> {
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.onTintColor = value
            }
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.onTintColor)
            hold(disposable, for: "onTintColor")
        }
    }

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

}
#endif
