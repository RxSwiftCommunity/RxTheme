//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)


import RxSwift
import RxCocoa


public extension Reactive where Base: CAShapeLayer {

    /// Bindable sink for `strokeColor` property
    public var strokeColor: Binder<CGColor?> {
        return Binder(self.base) { view, attr in
            view.strokeColor = attr
        }
    }

    /// Bindable sink for `fillColor` property
    public var fillColor: Binder<CGColor?> {
        return Binder(self.base) { view, attr in
            view.fillColor = attr
        }
    }

}
#endif
