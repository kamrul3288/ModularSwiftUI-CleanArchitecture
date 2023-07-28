//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation
import Domain
import Di
import AppModel

public class PostRepoImpl : PostRepository{
    public init(){}
    
    @Inject(.singleton) var resources:NetworkBoundResources
    
    public func fetchPostList() async -> Result<[PostListApiResponse], NetworkErrorInterceptor> {
        do{
            let result = try await resources.downloadApiData(.postListURL)
            return Result.success(result)
        }catch{
            return Result.failure(error as! NetworkErrorInterceptor)
        }
    }
    
}
