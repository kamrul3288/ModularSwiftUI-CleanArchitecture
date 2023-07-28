//
//  ModularSwiftUI_CleanArchitectureApp.swift
//  ModularSwiftUI-CleanArchitecture
//
//  Created by Kamrul Hasan on 27/7/23.
//

import SwiftUI
import Di
import Data
import Domain

@main
struct MainApplication: App {
    
    init(){
        provideDependency()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                PostListView()
            }
        }
    }
    
    
    private func provideDependency(){
        DependencyInjector.provide(type: NetworkBoundResources.self, injectType: .singleton, factory: NetworkBoundResources())
        DependencyInjector.provide(type: PostRepository.self, injectType: .runtime, factory: PostRepoImpl())
        DependencyInjector.provide(type: PostListApiUseCase.self, injectType: .runtime, factory: PostListApiUseCase())
    }
}
