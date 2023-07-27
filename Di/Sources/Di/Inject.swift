//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation

@propertyWrapper
struct Inject<T>{
    var wrappedValue:T
    init(_ injectType:DiInjectType = .runtime){
        self.wrappedValue = DependencyInjector.resolve(injectType: injectType)
    }
}
