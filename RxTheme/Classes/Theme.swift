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

    /// observable emits current theme
    public var entry: Observable<T> {
        return _index.flatMap { [unowned self] (index) -> Observable<T> in
            return Observable<T>.just(self._themes[index])
        }
    }

    /// bind theme component to UI attribute
    public func bind<U>(_ from: @escaping ((T) -> U), to: Binder<U>) -> Disposable {
        return self.entry.map(from)
            .observeOn(MainScheduler.instance)
            .bind(to: to)
    }

    /// bind theme component to UI attributes
    public func bind<U>(_ from: @escaping ((T) -> U), to: Binder<U>...) -> CompositeDisposable {
        return CompositeDisposable(disposables: to.map { self.bind(from, to: $0) })
    }

}
