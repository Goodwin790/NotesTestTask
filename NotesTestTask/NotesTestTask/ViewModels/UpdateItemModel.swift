//
//  UpdateItemModel.swift
//  NotesTestTask
//
//  Created by Сергей Киров on 14.01.2023.
//

import SwiftUI

struct UpdateItemModel: View {
    var body: some View {
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
                .cornerRadius(10)
            
        }
    }
}

struct UpdateItemModel_Previews: PreviewProvider {
    static var previews: some View {
        UpdateItemModel()
    }
}
