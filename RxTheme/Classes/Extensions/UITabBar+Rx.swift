#if os(iOS)
    import UIKit
    import RxSwift
    import RxCocoa


    public extension Reactive where Base: UITabBar {
        /// Bindable sink for `barStyle` property
        public var barStyle: Binder<UIBarStyle> {
            return Binder(self.base) { view, style in
                view.barStyle = style
            }
        }

        /// Bindable sink for `barTintColor` property
        public var barTintColor: Binder<UIColor?> {
            return Binder(self.base) { view, color in
                view.barTintColor = color
            }
        }
    }
#endif

