//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation
import AppModel

public protocol PostRepository{
    func fetchPostList()async -> Result<[PostListApiResponse],NetworkErrorInterceptor>
}
