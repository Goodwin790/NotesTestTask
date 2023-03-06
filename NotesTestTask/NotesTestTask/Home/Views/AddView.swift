//
//  AddView.swift
//  ToDoListSwiftUIThinking
//
//  Created by Сергей Киров on 25.12.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var textFieldText = ""
    @State private var textEditorText = ""
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.4).ignoresSafeArea()
            VStack {
                TextFieldView(textFieldText: $textFieldText)
                TextEditorView(textEditorText: $textEditorText)
            }
            .padding(14)
            .navigationTitle("Add a note  🖊️")
            .onDisappear {
                if textFieldText.isEmpty  == false || textEditorText.isEmpty == false {
                    listViewModel.addItem(title: textFieldText, content: textEditorText)
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
