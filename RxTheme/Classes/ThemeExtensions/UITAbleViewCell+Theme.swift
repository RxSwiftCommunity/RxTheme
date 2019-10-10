//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa


public extension ThemeProxy where Base: UITableViewCell {

    /// (set only) bind a stream to selectionStyle
    var selectionStyle: ThemeSignal<UITableViewCell.SelectionStyle> {
        @available(*, unavailable)
        get { fatalError("Should use set only") }
        set {
            let disposable = newValue.bind(to: base.theme.binder(\.selectionStyle))
            hold(disposable, for: "selectionStyle")
        }
    }

}
#endif
