//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UIView {

    /// (set only) bind a stream to backgroundColor
    var backgroundColor: ThemeAttribute<UIColor?> {
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

    /// (set only) bind a stream to tintColor
    var tintColor: ThemeAttribute<UIColor?> {
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.tintColor = value
            }
            let disposable = newValue.steam
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.tintColor)
            hold(disposable, for: "tintColor")
        }
    }

}
#endif
