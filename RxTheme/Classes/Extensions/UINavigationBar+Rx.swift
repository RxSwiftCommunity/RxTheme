//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)
    import UIKit
    import RxSwift
    import RxCocoa


    public extension Reactive where Base: UINavigationBar {
        /// Bindable sink for `barStyle` property
        public var barStyle: Binder<UIBarStyle> {
            return Binder(self.base) { view, attr in
                view.barStyle = attr
            }
        }

        /// Bindable sink for `barTintColor` property
        public var barTintColor: Binder<UIColor?> {
            return Binder(self.base) { view, attr in
                view.barTintColor = attr
            }
        }

        /// Bindable sink for `titleTextAttributes` property
        public var titleTextAttributes: Binder<[NSAttributedStringKey: Any]?> {
            return Binder(self.base) { view, attr in
                view.titleTextAttributes = attr
            }
        }
    }
#endif

