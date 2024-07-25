//
//  HomeViewModel.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 25/07/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = APIService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
//            // STATIC Data for Testing
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.allCoins.append(DeveloperPreview.instance.coinDataProvider)
//            self.portfolioCoins.append(DeveloperPreview.instance.coinDataProvider)
//        }
        
        // FETCH API
        addSubcribers()
    }
    
    func addSubcribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
