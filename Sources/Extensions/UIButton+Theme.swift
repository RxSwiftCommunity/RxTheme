//
//  UIButton+Theme.swift
//  Pods
//
//  Created by duan on 2019/01/23.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa

public extension Reactive where Base: UIButton {

    /// Bindable sink for `titleColor` property
    func titleColor(for state: UIControl.State) -> Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.setTitleColor(attr, for: state)
        }
    }

}

public extension ThemeProxy where Base: UIButton {

    func titleColor(from newValue: ThemeAttribute<UIColor?>, for state: UIControl.State) {
        if let value = newValue.value {
            base.setTitleColor(value, for: state)
        }
        let disposable = newValue.steam
            .take(until: base.rx.deallocating)
            .observe(on: MainScheduler.instance)
            .bind(to: base.rx.titleColor(for: state))
        hold(disposable, for: "titleColor.forState.\(state.rawValue)")
    }

}
#endif
