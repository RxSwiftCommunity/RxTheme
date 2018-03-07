#if os(iOS) || os(tvOS)
    import UIKit
    import RxSwift
    import RxCocoa


    public extension Reactive where Base: UIBarButtonItem {
        /// Bindable sink for `tintColor` property
        public var tintColor: Binder<UIColor?> {
            return Binder(self.base) { view, color in
                view.tintColor = color
            }
        }
    }
#endif
