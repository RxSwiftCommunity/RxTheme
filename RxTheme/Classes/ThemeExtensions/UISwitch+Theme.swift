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
    public var onTintColor: Observable<UIColor?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.onTintColor)
            hold(disposable, for: "onTintColor")
        }
    }

    /// (set only) bind a stream to thumbTintColor
    public var thumbTintColor: Observable<UIColor?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.thumbTintColor)
            hold(disposable, for: "thumbTintColor")
        }
    }

}
#endif
