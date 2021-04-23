//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UIActivityIndicatorView {

    /// (set only) bind a stream to style
    var style: ThemeAttribute<UIActivityIndicatorView.Style> {
        get { return .empty() }
        set {
            if let value = newValue.value {
                base.style = value
            }
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.style)
            hold(disposable, for: "style")
        }
    }

}
#endif
