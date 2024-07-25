//
//  eKoinsApp.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 25/07/24.
//

import SwiftUI

@main
struct eKoinsApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
