import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UITextView {
    /// Bindable sink for `font` property
    public var font: Binder<UIFont?> {
        return Binder(self.base) { view, attr in
            view.font = attr
        }
    }

    /// Bindable sink for `textColor` property
    public var textColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.textColor = attr
        }
    }
}
