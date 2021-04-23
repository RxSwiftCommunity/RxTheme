//
//  ThemeAttribute.swift
//  Pods
//
//  Created by mk on 2021/4/23.
//

import Foundation
import RxSwift

public class ThemeAttribute<U> {
    public var value: U?
   
    public var stream: Observable<U> = .empty()
    
    static func empty() -> ThemeAttribute {
        return ThemeAttribute()
    }
    
    init() { }
    
    init<Provider: ThemeProvider>(service: ThemeService<Provider>, mapper: @escaping ((Provider.T) -> U)) {
        value = mapper(service.attrs)
        stream = service.attrStream(mapper)
    }
}

extension ThemeService {
    
    public func attribute<U>(_ mapper: @escaping ((Provider.T) -> U)) -> ThemeAttribute<U> {
        return ThemeAttribute(service: self, mapper: mapper)
    }
    
}
