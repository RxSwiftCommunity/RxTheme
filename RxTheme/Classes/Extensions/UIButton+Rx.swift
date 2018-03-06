import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UIButton {
    /// Bindable sink for `setImage(<>, for: [])`
    public var image: Binder<UIImage?> {
        return Binder(self.base) { view, attr in
            view.setImage(attr, for: [])
        }
    }

    /// Bindable sink for `setBackgroundImage(<>, for: [])`
    public var backgroundImage: Binder<UIImage?> {
        return Binder(self.base) { view, attr in
            view.setBackgroundImage(attr, for: [])
        }
    }

    /// Bindable sink for `tintColor` property
    public var tintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.tintColor = attr
        }
    }
}
