import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UIApplication {
    /// Bindable sink for `statusBarStyle` property
    public var statusBarStyle: Binder<UIStatusBarStyle> {
        return Binder(self.base) { app, style in
            app.statusBarStyle = style
        }
    }
}
