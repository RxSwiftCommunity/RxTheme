//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit
    import RxSwift
    import RxCocoa


    public struct AnimatedSink<Base> {
        public var base: Base
        public init(base: Base) {
            self.base = base
        }
    }

    public extension AnimatedSink where Base: UIView {
        public var animated: Binder<UIColor?> {
            return Binder(self.base) { view, color in
                UIView.animate(withDuration: 0.1, animations: {
                    view.backgroundColor = color
                })
            }
        }
    }

    public extension Reactive where Base: UIView {
        /// Bindable sink for `backgroundColor` property
        public var backgroundColor: Binder<UIColor?> {
            return Binder(self.base) { view, color in
                view.backgroundColor = color
            }
        }

        /// Bindable sink for `tintColor` property
        public var tintColor: Binder<UIColor?> {
            return Binder(self.base) { view, color in
                view.tintColor = color
            }
        }
    }
#endif
