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
    var selectionStyle: Observable<UITableViewCell.SelectionStyle> {
        get { return .empty() }
        set {
            let disposable = newValue
                .takeUntil(base.rx.deallocating)
                .observeOn(MainScheduler.instance)
                .bind(to: base.rx.selectionStyle)
            hold(disposable, for: "selectionStyle")
        }
    }

}
#endif
