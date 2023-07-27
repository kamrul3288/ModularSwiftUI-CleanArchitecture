//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation
import AppModel
import Di

class PostListApiUseCase : ApiUseCaseNonParams{
    typealias T = [PostListApiResponse]
    @Inject var repository:PostRepository
    
    func execute() async -> Result<[PostListApiResponse], NetworkErrorInterceptor> {
        return await repository.fetchPostList()
    }
   
}
