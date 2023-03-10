//
//  ListViewModel.swift
//  ToDoListSwiftUIThinking
//
//  Created by Сергей Киров on 29.12.2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey = "itemsList"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self .items = savedItems
    }
    
    func deleteItem(offSet: IndexSet) {
        items.remove(atOffsets: offSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, content: String) {
        let newItem = ItemModel(title: title, content: content, isPinned: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel, title: String, content: String) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateText(title: title, content: content)
            let element = items.remove(at: index)
            items.insert(element, at: 0)
        }
    }
    
    func pinnedItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.pinned()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
