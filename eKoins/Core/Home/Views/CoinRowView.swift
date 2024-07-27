//
//  CoinRowView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 25/07/24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingColumns: Bool
    
    
    var body: some View {
        HStack (spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingColumns {
              centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

#Preview {
    // Using Shared Data with Singleton
    Group {
        CoinRowView(coin: DeveloperPreview.instance.coinDataProvider, showHoldingColumns: true)
            .previewLayout(.sizeThatFits)
        CoinRowView(coin: DeveloperPreview.instance.coinDataProvider, showHoldingColumns: true)
            .previewLayout(.sizeThatFits)
    }
    
}


extension CoinRowView {
    private var leftColumn: some View {
        HStack (spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack (alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .bold()
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack (alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith2Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green
                    : Color.theme.red
                )

        }
        .frame(width: UIScreen.main.bounds.width / 3.5)
    }
}
