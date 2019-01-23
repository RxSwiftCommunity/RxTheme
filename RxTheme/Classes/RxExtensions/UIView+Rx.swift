//
//  Created by duan on 2018/3/7.
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
            view.backgroundColor = attr
        }
    }

    /// Bindable sink for `tintColor` property
    public var tintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.tintColor = attr
        }
    }

}
#endif
