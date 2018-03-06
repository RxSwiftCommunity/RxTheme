import UIKit
import RxSwift
import RxCocoa


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
