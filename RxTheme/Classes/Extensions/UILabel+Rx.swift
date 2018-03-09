//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UILabel {

    /// Bindable sink for `font` property
    public var font: Binder<UIFont> {
        return Binder(self.base) { view, attr in
            view.font = attr
        }
    }

    /// Bindable sink for `textColor` property
    public var textColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            UIView.animate(withDuration: 0.3, animations: {
                view.textColor = attr
            })
        }
    }

    /// Bindable sink for `highlightedTextColor` property
    public var highlightedTextColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            UIView.animate(withDuration: 0.3, animations: {
                view.highlightedTextColor = attr
            })
        }
    }

    /// Bindable sink for `shadowColor` property
    public var shadowColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            UIView.animate(withDuration: 0.3, animations: {
                view.shadowColor = attr
            })
        }
    }

}
#endif
