//
//  ContentView.swift
//  ModularSwiftUI-CleanArchitecture
//
//  Created by Kamrul Hasan on 27/7/23.
//

import SwiftUI
import Di
import AppModel

struct PostListView: View {
    @StateObject private var viewModel = PostListViewModel()
    
    var body: some View {
        VStack{
            if (viewModel.isLoading) {
                ProgressView()
            }
            else if(viewModel.errorMessage != nil) {
                Text(viewModel.errorMessage ?? "Error")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
            }
            else{
                
                List(viewModel.postList, id:\.id){item in
                    HStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 8)
                            .foregroundColor(.random)
                        
                        VStack(
                            alignment: .leading
                        ){
                            Text(item.title.firstCharacterUpperCase() ?? "No Title")
                                .font(.title3)
                                .lineLimit(2)
                                .padding(.bottom,4)
                            Text(item.body.replacingOccurrences(of: "\n", with: " "))
                                .font(.caption)
                                
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.fetchPostList()
        }
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.automatic)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
