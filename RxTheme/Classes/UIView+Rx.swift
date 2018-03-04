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

    public var borderColor: Binder<UIColor?> {
        return Binder(self.base) { view, color in
            view.layer.borderColor = color?.cgColor
        }
    }
}
