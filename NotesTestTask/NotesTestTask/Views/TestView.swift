//
//  TestView.swift
//  NotesTestTask
//
//  Created by Сергей Киров on 12.01.2023.
//

import SwiftUI

struct TestView: View {
    @State private var selectedFont = "Helvetica"
      @State private var text = ""
      var body: some View {
          VStack {
              TextEditor(text: $text)
                  .font(.custom(selectedFont, size: 18))
              HStack {
                  Button(action: {
                      self.selectedFont = "Helvetica"
                  }) {
                      Text("Helvetica")
                  }
                  Button(action: {
                      self.selectedFont = "Arial"
                  }) {
                      Text("Arial")
                  }
              }
          }
      }
  }





struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
