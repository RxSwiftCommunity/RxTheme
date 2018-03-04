import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UILabel {
    /// Bindable sink for `textColor` property
    public var textColor: Binder<UIColor?> {
        return Binder(self.base) { view, color in
            view.textColor = color
        }
    }
}
