#if os(iOS) || os(tvOS)
    import UIKit
    import RxSwift
    import RxCocoa


    public extension Reactive where Base: UIActivityIndicatorView {
        /// Bindable sink for `activityIndicatorViewStyle` property
        public var activityIndicatorViewStyle: Binder<UIActivityIndicatorViewStyle> {
            return Binder(self.base) { view, attr in
                view.activityIndicatorViewStyle = attr
            }
        }
    }
#endif
