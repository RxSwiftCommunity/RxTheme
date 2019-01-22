//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UIActivityIndicatorView {

    /// Bindable sink for `style` property
    public var style: Binder<UIActivityIndicatorView.Style> {
        return Binder(self.base) { view, attr in
            view.style = attr
        }
    }

}
#endif
