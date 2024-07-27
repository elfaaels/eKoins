//
//  UIApplication.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 27/07/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
