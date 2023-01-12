//
//  ToDoListSwiftUIThinkingApp.swift
//  ToDoListSwiftUIThinking
//
//  Created by Сергей Киров on 25.12.2022.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - Manage models for View
 */

@main
struct ToDoListSwiftUIThinkingApp: App {
    
  @StateObject  var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
