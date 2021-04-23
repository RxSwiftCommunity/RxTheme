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
    var selectionStyle: ThemeAttribute<UITableViewCell.SelectionStyle> {
        get { fatalError("set only") }
        set {
            base.selectionStyle = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.selectionStyle)
            hold(disposable, for: "selectionStyle")
        }
    }

}
#endif
