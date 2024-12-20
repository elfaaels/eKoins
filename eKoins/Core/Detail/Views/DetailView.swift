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
    @State private var showFullDesc: Bool = false
    
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
            VStack {
                Spacer()
                HStack (spacing: 8) {
                    Text(vm.coin.name)
                        .font(.customFont(font: .pixelifySans, style: .bold, size: .h1))
                    CoinImageView(coin: vm.coin)
                        .frame(width: 25, height: 25)
                }
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                VStack (spacing: 20) {
                    // OVERVIEW
                    overviewContent
                    // DESCRIPTION
                    descriptionContent
                    // ADDITIONAl
                    additionalContent
                    // LINKS
                    linkSection
                }
                .padding()
            }
           
        }
//        .navigationTitle(vm.coin.name)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing, content: {
//              navigationBarTraillingItems
//            })
//       }
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
                .font(.customFont(font: .pixelifySans, style: .semiBold, size: .h1))
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
                .font(.customFont(font: .pixelifySans, style: .semiBold, size: .h1))
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
    
    private var navigationBarTraillingItems: some View {
        return HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
            .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var descriptionContent: some View {
        ZStack {
            if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
                VStack (alignment: .leading) {
                    Text(coinDescription)
                        .lineLimit(showFullDesc ? nil : 3)
                        .font(.customFont(font: .firaCode, style: .regular, size: .h3))
                        .foregroundColor(Color.theme.secondaryText)
                    Button(action: {
                        withAnimation(.smooth) {
                            showFullDesc.toggle()
                        }
                    }, label: {
                        Text(showFullDesc ? "Less" : "More...")
                            .font(.customFont(font: .firaCode, style: .bold, size: .h3))
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    })
                    .accentColor(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private var linkSection: some View {
        VStack (alignment: .leading) {
            Text("References")
                .font(.customFont(font: .pixelifySans, style: .semiBold, size: .h1))
                .foregroundColor(Color.theme.accent)
            HStack (spacing: 20) {
                if let websiteStr = vm.websiteURL,
                   let url = URL(string: websiteStr) {
                    Link("Website".uppercased(), destination: url)
                }
                if let redditStr = vm.redditURL,
                   let url = URL(string: redditStr) {
                    Link("Reddit".uppercased(), destination: url)
                }
            }
            .padding(.top, 10)
            .accentColor(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
