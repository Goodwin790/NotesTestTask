//
//  NotesTestTaskApp.swift
//  NotesTestTask
//
//  Created by Сергей Киров on 11.01.2023.

import SwiftUI

@main
struct NotesTestTaskApp: App {
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
