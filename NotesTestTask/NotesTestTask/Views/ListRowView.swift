//
//  ListRowView.swift
//  ToDoListSwiftUIThinking
//
//  Created by Сергей Киров on 25.12.2022.
//

import SwiftUI

struct ListRowView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    let item: ItemModel
    
    var body: some View {
        ZStack {
            Color.gray
//                .frame(maxWidth: .infinity)
//                .frame(height: 70)
                .cornerRadius(10)
            
            HStack {
                if item.isPinned {
                    Image(systemName: "pin.fill")
                        .foregroundColor(.red)
                }
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.title)
                    
                    Text(item.content)
                        .font(.headline)
                }
                Spacer()
                Spacer()
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                if item.isPinned {
                    Button("Unpinned") {
                        listViewModel.pinnedItem(item: item)
                    }
                    .tint(.orange)
                    
                } else {
                    Button("Pinned") {
                        listViewModel.pinnedItem(item: item)
                    }
                    .tint(.yellow)
                }
            }
            .frame(height: 25)
        .padding(.vertical, 8)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Example pinned", content: "Test content", isPinned: true)
    static var item2 = ItemModel(title: "Not pinned", content: "Test content", isPinned: false)
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
