//
//  NoItemsView.swift
//  ToDoListSwiftUIThinking
//
//  Created by Сергей Киров on 02.01.2023.
//

import SwiftUI

struct NoItemsView: View {
    
    var body: some View {
        List {
            ListRowView(item: ItemModel(title: "Test note", content: "This is the exaample content of note", isPinned: false))
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
