//
//  ContentView.swift
//  ModularSwiftUI-CleanArchitecture
//
//  Created by Kamrul Hasan on 27/7/23.
//

import SwiftUI
import Domain
import Di
import Data

struct ContentView: View {
    @Inject var reposiory:PostListApiUseCase
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
