//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UITableViewCell {

    /// Bindable sink for `selectionStyle` property
    public var selectionStyle: Binder<UITableViewCell.SelectionStyle> {
        return Binder(self.base) { view, attr in
            view.selectionStyle = attr
        }
    }

}
#endif
