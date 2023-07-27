//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation

enum NetworkErrorInterceptor : Error{
    case badUrl(String?)
    case decodingError
    case invalidServerResponse(Int,String?)
    case InvalidToken
    case noInternet
    case connectionTimeout
    case unknownError
    case noData

    var message: String{
        switch self{
        case .badUrl(let url): return "Invalid URL: \(String(describing: url))"
            case .decodingError:  return "Data missmatch. Please try again!"
            case .invalidServerResponse(_,let message): return message ?? "Unknown error occurred. Please try again"
            case .unknownError: return "Unknown error occurred. Please try again"
            case .noInternet: return "No internet connection. Please check your internet connection"
            case .connectionTimeout: return "Connection timeout. Please try again"
            case .noData: return "No data found. Please try again"
            case .InvalidToken: return "Invalid Token."
        }
    }
        
    var code: Int{
        switch self{
            case .badUrl(_): return 0
            case .decodingError:  return 0
            case .invalidServerResponse(let errorCode, _): return errorCode
            case .unknownError: return 0
            case .noInternet: return 0
            case .connectionTimeout: return 0
            case .noData: return 0
            case .InvalidToken: return 401
        }
    }
}
