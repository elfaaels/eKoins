//
//  APIService.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 25/07/24.
//

import Foundation
import Combine

class APIService {
    // Publishers can have Subscribers
    @Published var allCoins: [CoinModel] = []
    var coinSubsription: AnyCancellable?
    //    var cancellables =  Set<AnyCancellable>()

    
    let baseURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    
    init() {
        getCoins()
        
    }
    
   func getCoins() {
        guard let url = URL(string: baseURL) else { return }
        
        // Use reusable Networking Layer - NetworkManager()
        coinSubsription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubsription?.cancel()
            })
//            .store(in: &cancellables)

        
    }
}
