//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UITextField {

    /// Bindable sink for `font` property
    public var font: Binder<UIFont?> {
        return Binder(self.base) { view, attr in
            view.font = attr
        }
    }

    /// Bindable sink for `textColor` property
    public var textColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.textColor = attr
        }
    }

    /// Bindable sink for `keyboardAppearance` property
    public var keyboardAppearance: Binder<UIKeyboardAppearance> {
        return Binder(self.base) { view, attr in
            view.keyboardAppearance = attr
        }
    }

}
#endif