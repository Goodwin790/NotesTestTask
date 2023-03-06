//
//  SearchView.swift
//  NotesTestTask
//
//  Created by Сергей Киров on 03.03.2023.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var body: some View {
        TextField("Search by name or symbol...", text: $searchText)
            .offset(y: -10)
            .padding(.top)
            .padding(.horizontal)
            .background(Color.secondary.opacity(0.5))
            .cornerRadius(10)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""))
    }
}
