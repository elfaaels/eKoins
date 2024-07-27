//
//  CircleButtonView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 25/07/24.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    
    
    var body: some View {
      Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0
            )
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "heart.fill")
        .previewLayout(.sizeThatFits)
}
