//
//  MarketDataService.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 27/07/24.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
    var marketSubsription: AnyCancellable?

    let baseURL = "https://api.coingecko.com/api/v3/global"
    
    init() {
        getData()
        
    }
    
    func getData() {
        guard let url = URL(string: baseURL) else { return }
        
        // Use reusable Networking Layer - NetworkManager()
        marketSubsription = NetworkManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data // -> MarketDatModel
                self?.marketSubsription?.cancel()
            })

        
    }
    
    
}
