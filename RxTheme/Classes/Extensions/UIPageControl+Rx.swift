//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit
    import RxSwift
    import RxCocoa


    public extension Reactive where Base: UIPageControl {
        /// Bindable sink for `pageIndicatorTintColor` property
        public var pageIndicatorTintColor: Binder<UIColor?> {
            return Binder(self.base) { view, attr in
                view.pageIndicatorTintColor = attr
            }
        }

        /// Bindable sink for `currentPageIndicatorTintColor` property
        public var currentPageIndicatorTintColor: Binder<UIColor?> {
            return Binder(self.base) { view, attr in
                view.currentPageIndicatorTintColor = attr
            }
        }
    }
#endif
