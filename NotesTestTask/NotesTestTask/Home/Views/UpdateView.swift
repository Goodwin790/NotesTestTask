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
                TextFieldView(textFieldText: $textFieldText)
                TextEditorView(textEditorText: $textEditorText)
            }
            .padding(14)
            .navigationTitle("🖊️")
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
