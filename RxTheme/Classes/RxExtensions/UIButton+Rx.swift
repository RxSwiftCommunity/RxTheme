//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UIButton {

    /// Bindable sink for `titleColor` property
    public func titleColor(for state: UIControl.State) -> Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            UIView.animate(withDuration: 0.3, animations: {
                view.setTitleColor(attr, for: state)
            })
        }
    }
    
}
#endif
