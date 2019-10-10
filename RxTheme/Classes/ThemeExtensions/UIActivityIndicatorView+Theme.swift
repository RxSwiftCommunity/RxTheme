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
    var style: ThemeSignal<UIActivityIndicatorView.Style> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.style))
            hold(disposable, for: "style")
        }
    }

}
#endif
