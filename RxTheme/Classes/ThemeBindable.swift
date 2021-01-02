//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


public class ThemeBindable<T> {
    private let relay: Observable<T>
    private var disposables: [Disposable]

    init(relay: Observable<T>) {
        self.relay = relay
        self.disposables = []
    }

    /// Bind theme attributes to UI attributes
    ///
    /// - Parameters:
    ///   - from: attribute map
    ///   - binders: Binder sinks
    /// - Returns: ThemeBindable instance
    @discardableResult
    public func bind<U>(_ from: @escaping ((T) -> U),
                        to binders: [Binder<U>]) -> ThemeBindable {
        disposables += binders.map {
            self.relay.map(from)
                .observe(on: MainScheduler.instance)
                .bind(to: $0)
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
    public func bind<U>(_ from: @escaping ((T) -> U), to binders: Binder<U>...) -> ThemeBindable {
        return self.bind(from, to: binders)
    }

    /// Add disposables to dispose bag
    public func disposed(by disposeBag: DisposeBag) {
        CompositeDisposable(disposables: disposables).disposed(by: disposeBag)
    }
}
