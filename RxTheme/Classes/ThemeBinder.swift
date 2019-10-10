//
//  ThemeBinder.swift
//  Pods
//
//  Created by duan on 2019/10/10.
//

import Foundation

public class ThemeBinder<V> {
    public let setter: (V) -> Void
    public init<Target: AnyObject>(_ target: Target, setter: @escaping (Target, V) -> Void) {
        weak var weakTarget = target
        self.setter = { v in
            guard let target = weakTarget else { return }
            setter(target, v)
        }
    }
}
