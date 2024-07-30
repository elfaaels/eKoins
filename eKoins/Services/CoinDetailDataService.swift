//
//  CoinDetailDataService.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 30/07/24.
//

import Foundation
import Combine

class CoinDetailDataService {
    @Published var coinDetails: CoinDetailModel? = nil

    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel

    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
        
    }
    
   func getCoinDetails() {
       
       let baseURL = "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
       
       
        guard let url = URL(string: baseURL) else { return }
        
        // Use reusable Networking Layer - NetworkManager()
       coinDetailSubscription = NetworkManager.download(url: url)
              .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
              .receive(on: DispatchQueue.main)
              .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                  self?.coinDetails = returnedCoinDetails
                  self?.coinDetailSubscription?.cancel()
              })
      }
    
}
