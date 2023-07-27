//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation
import AppModel

extension Resources{
    
    static var  postListURL:Resources<[PostListApiResponse]>{
        return Resources<[PostListApiResponse]>(
            url: URL(string: "/posts",relativeTo: Self.baseUrl)!,
            method: HTTPMethod.GET([])
        )
    }
}
