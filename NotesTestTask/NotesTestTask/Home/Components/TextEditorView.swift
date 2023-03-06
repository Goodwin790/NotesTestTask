//
//  TextEditorView.swift
//  NotesTestTask
//
//  Created by Сергей Киров on 03.03.2023.
//

import SwiftUI

struct TextEditorView: View {
    @Binding var textEditorText: String
    var body: some View {
        TextEditor(text: $textEditorText)
            .cornerRadius(10)
            .padding(.vertical, 5)
            .frame(minHeight: 100)
            .cornerRadius(10)
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(textEditorText: .constant(""))
    }
}
