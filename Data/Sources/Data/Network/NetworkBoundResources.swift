//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation

class NetworkBoundResources{
    
    func downloadApiData<T:Codable>(_ resource:Resources<T>) async throws -> T{
        do{
            
            //-----------Set Up URLRequest---------------
            var request = URLRequest(url: resource.url)
            request.allHTTPHeaderFields = ["Content-Type":"applocation/json"]
            request.httpMethod = resource.method.name
            request.timeoutInterval = 30
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: true)
            
            //--------- Configure HTTP Method--------------
            switch resource.method{
            case .GET(let queryItems): components?.queryItems = queryItems
            case .POST(let body): request.httpBody = requestBodyFrom(params: body)
            }
            
            //----------- Configure API URL--------------
            guard let url = components?.url else{
                throw NetworkErrorInterceptor.badUrl(components?.url?.absoluteString)
            }
            request.url = url
            
            //----------- Set Up URLSessionConfiguration and custom header-----------
            let configuraton = URLSessionConfiguration.default
            configuraton.httpAdditionalHeaders = resource.headers
            
            //--------- Start Downloading data--------------
            let session = URLSession(configuration: configuraton)
            let (data, response) = try await session.data(for: request)
            
            //--------- Check HTTP Error Or Not--------------
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkErrorInterceptor.unknownError
            }
            
            //----------Check Resonse is Error-----------------------
            if(httpResponse.statusCode<200 && httpResponse.statusCode>300){
                if(httpResponse.statusCode == 401){
                    // call token refresh api
                    // the call return try await performApi(resource)
                }
                do{
                    let error = try JSONDecoder().decode(ServerErrorResponse.self, from: data)
                    throw NetworkErrorInterceptor.invalidServerResponse(httpResponse.statusCode, error.message)
                }catch{
                    throw NetworkErrorInterceptor.invalidServerResponse(httpResponse.statusCode, error.localizedDescription)
                }
            }
            
            //----------When Response is Success----------------
            do{
                let result = try JSONDecoder().decode(T.self, from: data)
                return result
            }catch{
                throw NetworkErrorInterceptor.decodingError
            }
            
        }catch{
            guard let urlError = error as? URLError else{
                throw NetworkErrorInterceptor.unknownError
            }
            if(urlError.code == .notConnectedToInternet){
                throw NetworkErrorInterceptor.noInternet
            }
            else if(urlError.code == .timedOut){
                throw NetworkErrorInterceptor.connectionTimeout
            }
            else{
                throw NetworkErrorInterceptor.unknownError
            }
        }
    }
    
    private func requestBodyFrom(params: [String: Any]?) -> Data? {
        guard let params = params else { return nil }
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return nil
        }
        return httpBody
    }
}
