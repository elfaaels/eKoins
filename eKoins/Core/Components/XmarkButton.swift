//
//  XmarkButton.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 29/07/24.
//

import SwiftUI

struct XmarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        Button(action: {
        presentationMode.wrappedValue.dismiss()
    }, label: {
            Image(systemName: "xmark")
            .font(.headline)
    })
    }
}

#Preview {
    XmarkButton()
}
