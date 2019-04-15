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

    func titleColor(from stream: Observable<UIColor?>, for state: UIControl.State) {
        let disposable = stream
            .takeUntil(base.rx.deallocating)
            .observeOn(MainScheduler.instance)
            .bind(to: base.rx.titleColor(for: state))
        hold(disposable, for: "titleColor.forState.\(state.rawValue)")
    }

}
#endif
