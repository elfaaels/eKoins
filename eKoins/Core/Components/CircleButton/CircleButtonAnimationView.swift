//
//  CircleButtonAnimationView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 25/07/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(
              Animation
                .easeOut(duration: 1.0)
                .repeatForever(autoreverses: true),
              value: UUID()
            )
//            .onAppear {
//                animate.toggle()
//            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
}
