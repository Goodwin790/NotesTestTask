//
//  ItemModel.swift
//  ToDoListSwiftUIThinking
//
//  Created by Сергей Киров on 28.12.2022.
//

import Foundation

// Immutable struct

struct ItemModel:Identifiable, Codable {
    let id: String
    var title: String
    var content: String
    var isPinned: Bool
    
    
    init(id: String = UUID().uuidString, title: String, content: String, isPinned: Bool) {
        self.id = id
        self.title = title
        self.content = content
        self.isPinned = isPinned
    }
    
    
    func pinned() -> ItemModel {
        return ItemModel(id: id, title: title, content: content, isPinned: !isPinned)
    }
    
    func updateText(title: String, content: String) -> ItemModel {
        return ItemModel(id: id, title: title, content: content, isPinned: isPinned)
    }
}
