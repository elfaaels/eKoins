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
    @StateObject var vm: DetailViewModel
    
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        Text("Test")
    }
}

#Preview {
    DetailView(coin: (DeveloperPreview.instance.coinDataProvider))
}
