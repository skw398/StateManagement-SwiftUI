//
//  ContentView.swift
//  StateManagement-SwiftUI
//
//  Created by Shigenari Oshio on 2023/12/14.
//

import SwiftUI

final class State: ObservableObject {
    @Published var name = ""
}

struct ContentView: View {
    private let state: State = .init()
    
    var body: some View {
        TabView {
            EditView()
                .environmentObject(state)
                .tabItem {
                    Label("Edit", systemImage: "square.and.pencil")
                }
            PreviewView()
                .environmentObject(state)
                .tabItem {
                    Label("Preview", systemImage: "doc.text")
                }
        }
    }
}

struct EditView: View {
    @EnvironmentObject private var state: State
    
    var body: some View {
        TextField("名前", text: $state.name)
            .textFieldStyle(.roundedBorder)
            .font(.largeTitle)
            .padding()
        
    }
}

struct PreviewView: View {
    @EnvironmentObject private var state: State
    
    var body: some View {
        Text(state.name)
            .font(.largeTitle)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
