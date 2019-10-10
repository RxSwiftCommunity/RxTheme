//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa



public class ThemeBindable<A> {
    private let signal: ThemeSignal<A>
    private var disposables: [Disposable] = []

    init(signal: ThemeSignal<A>) {
        self.signal = signal
    }

    /// Bind theme attributes to UI attributes
    ///
    /// - Parameters:
    ///   - from: attribute map
    ///   - binders: Binder sinks
    /// - Returns: ThemeBindable instance
    @discardableResult
    public func bind<B>(_ from: @escaping ((A) -> B),
                        to binders: [ThemeBinder<B>]) -> ThemeBindable {
        disposables += binders.map {
            self.signal.map(from).bind(to: $0)
        }
        return self
    }

    /// Bind theme attributes to UI attributes
    ///
    /// - Parameters:
    ///   - from: attribute map
    ///   - binders: Binder sinks
    /// - Returns: ThemeBindable instance
    @discardableResult
    public func bind<B>(_ from: @escaping ((A) -> B), to binders: ThemeBinder<B>...) -> ThemeBindable {
        return self.bind(from, to: binders)
    }

    /// Add disposables to dispose bag
    public func disposed(by disposeBag: DisposeBag) {
        CompositeDisposable(disposables: disposables).disposed(by: disposeBag)
    }
}
