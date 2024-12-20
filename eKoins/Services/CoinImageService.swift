//
//  CoinImageService.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 26/07/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    var imageSubsription: AnyCancellable?
    private let coin: CoinModel
//    private let fileManager = LocalFileManager.instance
//    private let folderName = "coin_images"
//    private let imageName: String
//    
    
    init(coin: CoinModel) {
        self.coin = coin
//        self.imageName = coin.id
        downloadCoinImage()
    }
    
//    private func getCoinImage() {
//        if let savedImage =  fileManager.getImage(imageName: imageName, folderName: folderName) {
//            image = savedImage
//        } else {
//            downloadCoinImage()
//        }
//    }
//    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        // Use reusable Networking Layer - NetworkManager()
        imageSubsription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
//                guard let self = self, let downloadedImage =  returnedImage else { return }
                self?.image = returnedImage
                self?.imageSubsription?.cancel()
//                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
