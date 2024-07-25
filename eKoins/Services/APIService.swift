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
//    var cancellables =  Set<AnyCancellable>()
    var coinSubsription: AnyCancellable?
    
    let baseURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    
    init() {
        getCoins()
        
    }
    
    private func getCoins() {
        guard let url = URL(string: baseURL) else { return }
        
        coinSubsription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubsription?.cancel()
            }
//            .store(in: &cancellables)

        
    }
}
