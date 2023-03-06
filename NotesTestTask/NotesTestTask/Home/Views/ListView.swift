//
//  ListView.swift
//  ToDoListSwiftUIThinking
//
//  Created by Сергей Киров on 25.12.2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var IsShowingUpdateView = false
    @State private var searchText = ""
    
    let listRowColor = Color("ListRowColor")
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.secondary.opacity(0.5).ignoresSafeArea()
                VStack {
                    SearchView(searchText: $searchText)
                    List {
                        if listViewModel.items.isEmpty {
                            NoItemsView()
                                .transition(AnyTransition.opacity.animation(.easeIn))
                        } else if !searchText.isEmpty {
                            searchSection
                        } else {
                            pinnedSection
                            notPinnedSection
                        }
                    }
                    .padding()
                    .listStyle(PlainListStyle())
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
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

extension ListView {
    
    private var pinnedSection: some View {
        Section {
            ForEach(listViewModel.items.filter {$0.isPinned}) { item in
                NavigationLink {
                    UpdateView(item: item)
                } label: {
                    ListRowView(item: item)
                }
                .listRowBackground(listRowColor.cornerRadius(10))
            }
            .onDelete (perform:   listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
    }
    
    private var notPinnedSection: some View {
        ForEach(listViewModel.items.filter {!$0.isPinned}) { item in
            NavigationLink {
                UpdateView(item: item)
            } label: {
                ListRowView(item: item)
            }
            .listRowBackground(listRowColor.cornerRadius(10))
        }
        .onDelete (perform:   listViewModel.deleteItem)
        .onMove(perform: listViewModel.moveItem)
    }
    
    private var searchSection: some View {
        ForEach(listViewModel.items.filter {$0.title.lowercased().contains(searchText.lowercased()) || $0.content.lowercased().contains(searchText.lowercased())}) { item in
            NavigationLink {
                UpdateView(item: item)
            } label: {
                ListRowView(item: item)
            }
            .listRowBackground(listRowColor.cornerRadius(10))
        }
        .onDelete (perform:   listViewModel.deleteItem)
        .onMove(perform: listViewModel.moveItem)
    }
    
}
