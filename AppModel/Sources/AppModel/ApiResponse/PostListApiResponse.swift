//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation

public struct PostListApiResponse : Codable, Identifiable{
    let userID:Int
    public let id: Int
    let title:String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
