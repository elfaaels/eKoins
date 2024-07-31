//
//  DetailView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 30/07/24.
//

import SwiftUI

struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            } else {
                Text("No Coin")
            }
        }
    }
}

struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30
    
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                Text("Test")
                    .frame(height: 150)
                // OVERVIEW
                overviewContent
                // ADDITIONAl
                additionalContent
            }
            .padding()
        }
        .navigationTitle(vm.coin.name)
    }
}

#Preview {
    NavigationView {
        DetailView(coin: (DeveloperPreview.instance.coinDataProvider))
    }
}

extension DetailView {
    private var overviewContent: some View {
        return VStack {
            Text("Overview")
                .font(.title)
                .bold()
                .foregroundColor(Color.theme.accent)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, content: {
                ForEach(vm.overviewStatistics) { stat in
                   StatisticView(stat: stat)
                }
            })
        }
    }
    
    private var additionalContent: some View {
        return VStack {
            Text("Additional Details")
                .font(.title)
                .bold()
                .foregroundColor(Color.theme.accent)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, content: {
                ForEach(vm.additionalStatistics) { stat in
                   StatisticView(stat: stat)
                }
            })
        }
    }
}
