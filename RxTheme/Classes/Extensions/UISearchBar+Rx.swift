#if os(iOS)
    import UIKit
    import RxSwift
    import RxCocoa


    public extension Reactive where Base: UISearchBar {
        /// Bindable sink for `barStyle` property
        public var barStyle: Binder<UIBarStyle> {
            return Binder(self.base) { view, attr in
                view.barStyle = attr
            }
        }

        /// Bindable sink for `barTintColor` property
        public var barTintColor: Binder<UIColor?> {
            return Binder(self.base) { view, attr in
                view.barTintColor = attr
            }
        }
    }
#endif

