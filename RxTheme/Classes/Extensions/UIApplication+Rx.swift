//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UIApplication {

    /// Bindable sink for `statusBarStyle` property
    public var statusBarStyle: Binder<UIStatusBarStyle> {
        return Binder(self.base) { view, attr in
            view.statusBarStyle = attr
        }
    }

}
#endif