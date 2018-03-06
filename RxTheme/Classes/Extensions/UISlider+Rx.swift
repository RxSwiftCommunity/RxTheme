import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UISlider {
    /// Bindable sink for `thumbTintColor` property
    public var thumbTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.thumbTintColor = attr
        }
    }

    /// Bindable sink for `minimumTrackTintColor` property
    public var minimumTrackTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.minimumTrackTintColor = attr
        }
    }

    /// Bindable sink for `maximumTrackTintColor` property
    public var maximumTrackTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.maximumTrackTintColor = attr
        }
    }
}
