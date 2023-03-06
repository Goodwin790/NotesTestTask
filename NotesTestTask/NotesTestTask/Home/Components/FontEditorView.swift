//
//  FontEditorView.swift
//  NotesTestTask
//
//  Created by Сергей Киров on 03.03.2023.
//

import SwiftUI

struct FontEditorView: View {
   @State private var fontWeights: [Font.Weight] = [.light, .semibold, .bold, .black]
   @State private var fontWeightsString = [ "light", "semibold", "bold", "black"]
   @State var font: Font = .headline
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 40) {
                        Text("Title")
                            .font(.title)
                        Text("Heading")
                            .font(.headline)
                        Text("Subheading")
                            .font(.subheadline)
                        Text("Body")
                            .font(.body)
                            .fontWeight(.black)
                    }
                }
                Picker("font weight", selection: $font) {
                    ForEach(fontWeights, id: \.self) {index in
                   
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

struct FontEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FontEditorView()
    }
}
