//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UIProgressView {

    /// Bindable sink for `progressTintColor` property
    var progressTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.progressTintColor = attr
        }
    }

    /// Bindable sink for `trackTintColor` property
    var trackTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.trackTintColor = attr
        }
    }

}
#endif
