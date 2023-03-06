//
//  Test.swift
//  NotesTestTask
//
//  Created by Сергей Киров on 12.01.2023.
//

import SwiftUI

struct Test: View {
    @State private var isBold = false
    @State private var isItalic = false
    @State private var text = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    self.isBold.toggle()
                }) {
                    Image(systemName: "bold")
                }
                Button(action: {
                    self.isItalic.toggle()
                }) {
                    Image(systemName: "italic")
                }
            }
        }
    }
}
