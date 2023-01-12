//
//  UpdateView.swift
//  NotesTestTask
//
//  Created by Сергей Киров on 11.01.2023.
//

import SwiftUI

struct UpdateView: View {
    @State private var textFieldText: String
    @State private var textEditorText: String
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var listViewModel: ListViewModel
    var item: ItemModel
    
    init(item: ItemModel) {
        self._textFieldText = State(initialValue: item.title)
        self._textEditorText = State(initialValue: item.content)
        self.item = item
    }
    
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.4).ignoresSafeArea()
            VStack {
                TextField("Type here label of note", text: $textFieldText)
                    .padding(.top)
                    .padding(.horizontal)
             .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                TextEditor(text: $textEditorText)
                    .cornerRadius(10)
                    .padding(.vertical, 5)
                    .frame(minHeight: 100)
            }
            .padding(14)
            .navigationTitle("Add a note  🖊️")
            .onDisappear {
                listViewModel.updateItem(item: item, title: textFieldText, content: textEditorText)
            }
        }
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var exampleNote = ItemModel(title: "Test note", content: "This is the exaample content of note", isPinned: false)
    
    static var previews: some View {
        
        UpdateView(item: exampleNote)
    }
}
