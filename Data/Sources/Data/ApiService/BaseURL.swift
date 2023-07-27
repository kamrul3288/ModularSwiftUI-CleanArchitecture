//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation

extension Resources{
    static var baseUrl:URL{
        #if DEBUG
            return development
        #else
            return production
        #endif
    }
    private static var development:URL{
        URL(string: "https://jsonplaceholder.typicode.com")!
    }
    private static var production:URL{
        URL(string: "https://jsonplaceholder.typicode.com")!
    }

}
