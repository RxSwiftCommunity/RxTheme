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


public extension ThemeProxy where Base: UIButton {

    func titleColor(from stream: ThemeSignal<UIColor?>, for state: UIControl.State) {
        let binder = ThemeBinder<UIColor?>(base, setter: { a, v in
            a.setTitleColor(v, for: state)
        })
        let disposable = stream.bind(to: binder)
        hold(disposable, for: "titleColor.forState.\(state.rawValue)")
    }

}
#endif
