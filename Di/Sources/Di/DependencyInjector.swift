//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation
public final class DependencyInjector{
    
    private  var cache: [String: Any] = [:]
    private  var generators: [String: ()->Any] = [:]
    private static let shared = DependencyInjector.init()
    
    
    public static func provide<T>(type: T.Type, injectType:DiInjectType, factory: @autoclosure @escaping ()->T){
        shared.generators[String(describing: type.self)] = factory
        if( injectType == .singleton){
            shared.cache[String(describing: type.self)] = factory()
        }
    }
    
    public static func resolve<T>(injectType:DiInjectType = .runtime)->T{
        let key = String(describing: T.self)
        switch injectType{
            case .singleton:
            guard let dependency =  shared.cache[key] as? T else{
                fatalError("\(key): Singleton Dependency not found. Please Register the dependency first.")
            }
            return dependency
        case .runtime:
            guard let dependency =  shared.generators[key]?() as? T else{
                fatalError("\(key): Dependency not found. Please Register the dependency first.")
            }
            return dependency
        }
    }
}
