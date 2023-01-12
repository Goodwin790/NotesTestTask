//
//  ListRowView.swift
//  ToDoListSwiftUIThinking
//
//  Created by Сергей Киров on 25.12.2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Example isCompleted", isCompleted: true)
    static var item2 = ItemModel(title: "Not completed", isCompleted: false)
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
