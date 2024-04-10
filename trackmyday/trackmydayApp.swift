//
//  trackmydayApp.swift
//  trackmyday
//
//  Created by Peter Johnson on 4/6/24.
//

import SwiftUI

@main
struct trackmydayApp: App {
    
    @StateObject var allTodos = TodoDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(allTodos)
        }
    }
}
