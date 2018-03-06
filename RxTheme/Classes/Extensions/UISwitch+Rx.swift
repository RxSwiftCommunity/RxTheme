import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UISwitch {
    /// Bindable sink for `onTintColor` property
    public var onTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.onTintColor = attr
        }
    }

    /// Bindable sink for `thumbTintColor` property
    public var thumbTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.thumbTintColor = attr
        }
    }
}
