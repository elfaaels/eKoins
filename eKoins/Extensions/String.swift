//
//  String.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 31/07/24.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
