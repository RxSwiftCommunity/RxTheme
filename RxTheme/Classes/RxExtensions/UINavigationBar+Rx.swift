//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UINavigationBar {

    /// Bindable sink for `barStyle` property
    var barStyle: Binder<UIBarStyle> {
        return Binder(self.base) { view, attr in
            view.barStyle = attr
        }
    }

    /// Bindable sink for `barTintColor` property
    var barTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.barTintColor = attr
        }
    }

    /// Bindable sink for `titleTextAttributes` property
    var titleTextAttributes: Binder<[NSAttributedString.Key: Any]?> {
        return Binder(self.base) { view, attr in
            view.titleTextAttributes = attr
        }
    }

}
#endif
