//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)
    import UIKit
    import RxSwift
    import RxCocoa


    public extension Reactive where Base: UITableView {
        /// Bindable sink for `separatorColor` property
        public var separatorColor: Binder<UIColor?> {
            return Binder(self.base) { view, color in
                view.separatorColor = color
            }
        }
    }
#endif
