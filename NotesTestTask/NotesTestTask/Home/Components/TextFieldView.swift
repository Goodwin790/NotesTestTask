//
//  TextFieldView.swift
//  NotesTestTask
//
//  Created by Сергей Киров on 03.03.2023.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textFieldText: String
    
    var body: some View {
        TextField("Type here label of note", text: $textFieldText)
            .padding(.top)
            .padding(.horizontal)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(textFieldText: .constant(""))
    }
}
