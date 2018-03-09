//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)


import RxSwift
import RxCocoa


public extension Reactive where Base: CALayer {

    /// Bindable sink for `backgroundColor` property
    public var backgroundColor: Binder<CGColor?> {
        return Binder(self.base) { view, attr in
            view.backgroundColor = attr
        }
    }

    /// Bindable sink for `borderWidth` property
    public var borderWidth: Binder<CGFloat> {
        return Binder(self.base) { view, attr in
            view.borderWidth = attr
        }
    }

    /// Bindable sink for `borderColor` property
    public var borderColor: Binder<CGColor?> {
        return Binder(self.base) { view, attr in
            view.borderColor = attr
        }
    }

    /// Bindable sink for `shadowColor` property
    public var shadowColor: Binder<CGColor?> {
        return Binder(self.base) { view, attr in
            view.shadowColor = attr
        }
    }

}
#endif
