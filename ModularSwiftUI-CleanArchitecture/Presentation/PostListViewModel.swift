//
//  PostListViewModel.swift
//  ModularSwiftUI-CleanArchitecture
//
//  Created by Kamrul Hasan on 28/7/23.
//

import Foundation
import AppModel
import Domain
import Di

@MainActor
class PostListViewModel : ObservableObject{
    
    @Published var postList: [PostListApiResponse] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Inject var postListApiUseCase:PostListApiUseCase
    
    func fetchPostList() async{
        isLoading = true
        errorMessage = nil
        switch await postListApiUseCase.execute(){
            case.success(let data):
                isLoading = false
                postList = data
            case.failure(let error):
                isLoading = false
                errorMessage = error.message
        }
    }
}
