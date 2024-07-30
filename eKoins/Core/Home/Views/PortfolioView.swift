//
//  PortfolioView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 29/07/24.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? =  nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        LazyHStack(spacing: 10) {
                            ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                                CoinLogoView(coin: coin)
                                    .frame(width: 75)
                                    .padding(4)
                                    .onTapGesture {
                                        withAnimation(.easeIn) {
                                            updateSelectedCoin(coin: coin)
                                        }
                                    }
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                                    )
                                
                            }
                            
                        }
                        .frame(height: 120)
                        .padding(.leading)
                        
                    }
                    if selectedCoin != nil {
                        VStack(spacing: 40) {
                            HStack {
                                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? "") : ")
                                Spacer()
                                Text(selectedCoin?.currentPrice.asCurrencyWith2Decimals() ?? "")
                            }
                            Divider()
                            HStack {
                                Text("Amount Holding: ")
                                Spacer()
                                TextField("Example: 1.4", text: $quantityText)
                                    .multilineTextAlignment(.trailing)
                            }
                            Divider()
                            HStack {
                                Text("Current Value:")
                                Spacer()
                                Text(getCurrentValue().asCurrencyWith2Decimals())
                            }
                        }
                        .animation(.none)
                        .padding()
                        .font(.headline)
                    }
                }
            }
            .padding()
            .navigationTitle("Edit Portfolio")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 10) {
                        Image(systemName: "checkmark")
                            .opacity(showCheckmark ? 1.0 : 0.0)
                        Button(action: {
                            saveButtonPressed()
                        }, label: {
                            Text("Save".uppercased())
                        })
                        .opacity(
                            (selectedCoin != nil  && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0
                        )
                    }
                    .font(.headline)
                }
            })
            .onChange(of: vm.searchText) { _ , value in
                if value == "" {
                    // remove selectedCoin
                    selectedCoin = nil
                    vm.searchText = ""
                    
                }
            }
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(DeveloperPreview.instance.homeVM)
}

extension PortfolioView {
    
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }),
           let amount = portfolioCoin.currentHoldings {
            quantityText = String(amount)
        } else {
            quantityText = ""
        }
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private func saveButtonPressed() {
        guard
            let coin = selectedCoin,
            let amount = Double(quantityText)
        else { return }
        
        // Save to Portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        
        withAnimation(.easeIn) {
            showCheckmark = true
            selectedCoin = nil
            vm.searchText = ""
        }
        
        // Hide Keyboard
        UIApplication.shared.endEditing()
        
        // Hide Checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
    }
    
}
