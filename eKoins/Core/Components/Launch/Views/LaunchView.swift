//
//  LaunchView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 04/08/24.
//

import SwiftUI

struct LaunchView: View {
    @State private var showLoadingText: Bool = false
    @Binding var showLaunchView: Bool
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    let now = Date.now

    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                ZStack {
                    if showLoadingText {
                        HStack (spacing: 0) {
                            Text("Loading...")
                                    .font(.customFont(font: .pixelifySans, style: .bold, size: .h2))
                                    .foregroundColor(Color.theme.accent)
                                    .padding(.top, 10)
                            }
                        .transition(AnyTransition.scale.animation(.easeIn))
                    } else {
                        HStack {
                            Text("eKoins")
                                .font(.customFont(font: .pixelifySans, style: .bold, size: .h1))
                                .foregroundColor(Color.theme.accent)
                            .padding(.top, 10)
                        }
                        .transition(AnyTransition.scale.animation(.easeIn))
                    }
                }
            }
            .onAppear {
                showLoadingText.toggle()
            }
            .onReceive(timer, perform: { _ in
                withAnimation(.spring()) {
                    showLaunchView = false
                }
            })
        }
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
