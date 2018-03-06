import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UILabel {
    /// Bindable sink for `font` property
    public var font: Binder<UIFont> {
        return Binder(self.base) { view, font in
            view.font = font
        }
    }

    /// Bindable sink for `textColor` property
    public var textColor: Binder<UIColor?> {
        return Binder(self.base) { view, color in
            view.textColor = color
        }
    }

    /// Bindable sink for `highlightedTextColor` property
    public var highlightedTextColor: Binder<UIColor?> {
        return Binder(self.base) { view, color in
            view.highlightedTextColor = color
        }
    }

    /// Bindable sink for `shadowColor` property
    public var shadowColor: Binder<UIColor?> {
        return Binder(self.base) { view, color in
            view.shadowColor = color
        }
    }
}
