//
//  Fonts.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 02/08/24.
//

import Foundation
import SwiftUI

enum CustomFonts: String {
    case firaCode = "FiraCode"
    case pixelifySans = "PixelifySans"

}

enum CustomFontStyle: String {
    case bold = "-Bold"
    case light = "-Light"
    case medium = "-Medium"
    case regular = "-Regular"
    case semiBold = "-SemiBold"
}

enum CustomFontSize: CGFloat {
    case h0 = 36.0
    case h1 = 32.0
    case h2 = 20.0
    case h3 = 16.0
    case h4 = 8.0
}

extension UIFont {
   
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: CustomFontSize,
        isScaled: Bool = true) -> UIFont {
            
            let fontName: String = font.rawValue + style.rawValue
            
            guard let font = UIFont(name: fontName, size: size.rawValue) else {
                debugPrint("Font can't be loaded")
                return UIFont.systemFont(ofSize: size.rawValue)
            }
            
            return isScaled ? UIFontMetrics.default.scaledFont(for: font) : font
        }
}

extension Font {
    
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: CustomFontSize,
        isScaled: Bool = true) -> Font {
            
            let fontName: String = font.rawValue + style.rawValue
            
            return Font.custom(fontName, size: size.rawValue)
        }
}
