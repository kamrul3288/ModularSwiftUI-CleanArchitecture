//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation
import AppModel

protocol PostRepository{
    func fetchPostList()async -> Result<[PostListApiResponse],NetworkErrorInterceptor>
}
