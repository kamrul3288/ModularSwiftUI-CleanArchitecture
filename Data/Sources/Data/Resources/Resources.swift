//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation
struct Resources<T:Codable>{
    let url:URL
    var headers: [String: String] = [:]
    let method: HTTPMethod
}

enum HTTPMethod{
    case GET([URLQueryItem])
    case POST(body: [String: Any]?)
    
    var name:String{
        switch self{
            case .GET: return "GET"
            case .POST: return "POST"
        }
    }
}
