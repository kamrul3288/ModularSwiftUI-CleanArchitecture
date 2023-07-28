//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation

public struct PostListApiResponse : Codable, Identifiable{
    public let userID:Int
    public let id: Int
    public let title:String
    public let body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
