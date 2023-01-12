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
                TextField("Type here label of note", text: $textFieldText)
                    .padding(.top)
                    .padding(.horizontal)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                TextEditor(text: $textEditorText)
                    .cornerRadius(10)
                    .padding(.vertical, 5)
                    .frame(minHeight: 100)
                    .keyboardType(.asciiCapableNumberPad)
                
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
