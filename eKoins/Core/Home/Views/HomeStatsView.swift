//
//  HomeStatsView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 27/07/24.
//

import SwiftUI

struct HomeStatsView: View {
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        ZStack {
            HStack (spacing: 5) {
                if !showPortfolio {
                    TabView (selection: $currentIndex) {
                        if !vm.statistics.isEmpty {
                            ForEach(0..<vm.statistics.count, id: \.self) { stat in
                                StatisticHomeView(stat: vm.statistics[stat])
                            }
                        } else {
                            EmptyView()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .onReceive(timer) { _ in
    //                           withAnimation {
    //                               currentIndex = (currentIndex + 1) % vm.statistics.count
    //                           }
                           }
                } else if showPortfolio {
                    HStack {
                        ForEach(vm.statistics) { stat in
                            StatisticOneView(stat: stat)
                        }
                        .frame(width: UIScreen.main.bounds.width / 1)
                    }
    //                .frame(width: UIScreen.main.bounds.width,
    //                       alignment: showPortfolio ? .trailing : .leading)
                }
            }
            .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading)
        }
        .frame(height: 250)
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false))
        .environmentObject(DeveloperPreview.instance.homeVM)
}
