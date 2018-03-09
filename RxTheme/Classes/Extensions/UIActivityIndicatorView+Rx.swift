//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UIActivityIndicatorView {

    /// Bindable sink for `activityIndicatorViewStyle` property
    public var activityIndicatorViewStyle: Binder<UIActivityIndicatorViewStyle> {
        return Binder(self.base) { view, attr in
            view.activityIndicatorViewStyle = attr
        }
    }

}
#endif