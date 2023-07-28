//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation
import AppModel
import Di

public class PostListApiUseCase: ApiUseCaseNonParams{
    public init(){}

    public typealias T = [PostListApiResponse]
    @Inject private var repository:PostRepository

    public func execute() async -> Result<[PostListApiResponse], NetworkErrorInterceptor> {
        return await repository.fetchPostList()
    }
   
}
