//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation

@propertyWrapper
public struct Inject<T>{
    public var wrappedValue:T
    public init(_ injectType:DiInjectType = .runtime){
        self.wrappedValue = DependencyInjector.resolve(injectType: injectType)
    }
}
