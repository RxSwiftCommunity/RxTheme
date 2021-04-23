//
//  ThemeAttribute.swift
//  Pods
//
//  Created by mk on 2021/4/23.
//

import Foundation
import RxSwift

public struct ThemeAttribute<T> {
    public var value: T
    public var stream: Observable<T>
}
