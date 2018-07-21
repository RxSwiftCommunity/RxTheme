//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import RxSwift
import RxCocoa


public class ThemeService<T:RawRepresentable & CaseIterable & CustomStringConvertible> where T.RawValue == Int {
    public let entry: BehaviorRelay<T>
    public typealias bindSuit<U> = (((T) -> U), [Binder<U>])
    
    /// return current theme
    public var theme: T
    /// return current theme rawValue
    public var index: Int {
        return theme.rawValue
    }

    /// All Themes
    public var allThemes: [T] {
        return T.allCases.map{$0}
    }
    
    /// All Theme names
    public var allThemeNames :[String] {
        return T.allCases.map{$0.description}
    }

    /// Initialize theme with enum
    ///
    /// - Parameter theme: Theme enum
    public init(theme:T) {
        self.theme = theme
        self.entry = BehaviorRelay<T>(value: theme)
    }
    
    
    /// Initialize theme with index value
    ///
    /// - Parameter index: Theme rawValue
    public convenience init(index:Int) {
        let theme = T(rawValue: index) ?? T(rawValue: 0)!
        self.init(theme:theme)
    }
    
    /// Set Theme
    ///
    /// - Parameter theme: Theme
    public func set(theme: T) {
        self.entry.accept(theme)
        self.theme = theme
    }
    
    /// Set Theme by rawValue
    ///
    /// - Parameter index: rawValue of Theme
    public func set(index: Int) {
        let theme = T(rawValue: index) ?? self.theme
        self.set(theme: theme)
    }
    
    /// Set Random Theme
    public func setRandomTheme() {
        if let theme = T.allCases.randomElement() {
            self.set(theme: theme)
        }
    }

    private func _bind<U>(_ from: @escaping ((T) -> U), to: Binder<U>) -> Disposable {
        return self.entry.map(from)
            .observeOn(MainScheduler.instance)
            .bind(to: to)
    }
    
    private func _bind<U>(_ from: @escaping ((T) -> U), to: [Binder<U>]) -> [Disposable] {
        return to.map { self._bind(from, to: $0) }
    }

    /// bind theme component to UI attributes
    public func bind<U>(_ from: @escaping ((T) -> U), to: [Binder<U>]) -> Disposable {
        return CompositeDisposable(disposables: _bind(from, to: to))
    }

    /// bind theme component to UI attributes
    public func bind<U>(_ from: @escaping ((T) -> U), to: Binder<U>...) -> Disposable {
        return CompositeDisposable(disposables: _bind(from, to: to))
    }

    /// bind bunch of stuff with same type at once
    public func bind<U>(_ suits: [bindSuit<U>]) -> Disposable {
        return CompositeDisposable.init(disposables: suits.map { self.bind($0, to: $1) })
    }
}
