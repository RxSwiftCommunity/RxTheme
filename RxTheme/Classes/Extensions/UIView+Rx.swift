//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UIView {

    /// Bindable sink for `backgroundColor` property
    public var backgroundColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            UIView.animate(withDuration: 0.3, animations: {
                view.backgroundColor = attr
            })
        }
    }

    /// Bindable sink for `tintColor` property
    public var tintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            UIView.animate(withDuration: 0.3, animations: {
                view.tintColor = attr
            })
        }
    }

}

public extension ThemeProxy where Base: UIView {
    public var backgroundColor: Observable<UIColor?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .bind(to: base.rx.backgroundColor)
            self.hold(disposable, for: "backgroundColor")
        }
    }
}

#endif
