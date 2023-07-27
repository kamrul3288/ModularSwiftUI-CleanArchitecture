//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation

struct PostListApiRespose : Codable, Identifiable{
    let userID:Int
    let id: Int
    let title:String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
