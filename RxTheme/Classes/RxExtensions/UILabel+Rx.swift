//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UILabel {

    /// Bindable sink for `font` property
    var font: Binder<UIFont> {
        return Binder(self.base) { view, attr in
            view.font = attr
        }
    }

    /// Bindable sink for `textColor` property
    var textColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.textColor = attr
        }
    }

    /// Bindable sink for `highlightedTextColor` property
    var highlightedTextColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.highlightedTextColor = attr
        }
    }

    /// Bindable sink for `shadowColor` property
    var shadowColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.shadowColor = attr
        }
    }

}
#endif
