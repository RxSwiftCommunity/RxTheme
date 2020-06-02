//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UISegmentedControl {

    /// Bindable sink for `style` property
    @available(iOS 13, tvOS 13, *)
    var selectedSegmentTintColor: Binder<UIColor> {
        return Binder(self.base) { view, attr in
            view.selectedSegmentTintColor = attr
        }
    }

}
#endif
