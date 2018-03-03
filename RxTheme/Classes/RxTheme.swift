import RxSwift
import RxCocoa


public class ThemeService<T> {
    private let _themes: Array<T>
    private let _index: BehaviorRelay<Int>

    /// return current theme index
    public var index: Int { return self._index.value }
    /// return current theme
    public var theme: T { return self._themes[self.index] }

    public init(themes: Array<T>, initialIndex: Int = 0) {
        if themes.count == 0 {
            fatalError("There must be more than one themes")
        }
        if initialIndex > themes.count - 1 || initialIndex < 0 {
            fatalError("No theme at index: \(initialIndex)")
        }
        self._themes = themes
        self._index = BehaviorRelay<Int>(value: initialIndex)
    }

    /// set current theme index
    public func set(index: Int) {
        if index > self._themes.count - 1 || index < 0 {
            fatalError("No theme at index: \(index)")
        }
        self._index.accept(index)
    }

    public func binder() -> Observable<T> {
        return _index.flatMap { [unowned self] (index) -> Observable<T> in
            return Observable<T>.just(self._themes[index])
        }
    }
}
