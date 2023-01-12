//
//  ListView.swift
//  ToDoListSwiftUIThinking
//
//  Created by Сергей Киров on 25.12.2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    
    var body: some View {
        
        ZStack {
            Color.gray.opacity(0.5).ignoresSafeArea()
            
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    Section("Pinned") {
                        ForEach(listViewModel.items.filter {$0.isPinned}) { item in
                                ListRowView(item: item)
                            
                        }
                        .onDelete (perform:   listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    
                    Section("Notes") {
                        ForEach(listViewModel.items.filter {!$0.isPinned}) { item in
                            
                            NavigationLink {
                                UpdateView(item: item)
                            } label: {
                                ListRowView(item: item)
                            }
                        }
                        .onDelete (perform:   listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                }
                .listStyle(GroupedListStyle())
            }
        }
        .navigationTitle("Notes 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
