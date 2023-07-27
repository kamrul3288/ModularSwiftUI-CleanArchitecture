//
//  File.swift
//  
//
//  Created by Kamrul Hasan on 27/7/23.
//

import Foundation
import AppModel

protocol ApiUseCaseNonParams{
    associatedtype T
    func execute()async -> Result<T,NetworkErrorInterceptor>
}
