//
//  SearchBarView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 27/07/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            TextField("Search", text: $searchText)
                .font(.customFont(font: .firaCode, style: .semiBold, size: .h3))
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accent.opacity(0.10),
                    radius: 10, x: 0, y: 0
                )
        )
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
