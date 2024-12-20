//
//  StatisticHomeView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 01/08/24.
//

import SwiftUI

struct StatisticHomeView: View {
    let stat: StatisticModel
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4)  {
            Text(stat.title)
                .font(.customFont(font: .pixelifySans, style: .semiBold, size: .h1))
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.customFont(font: .firaCode, style: .semiBold, size: .h2))
                .foregroundColor(Color.theme.accent)
            HStack (spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.customFont(font: .pixelifySans, style: .semiBold, size: .h4))
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180 ))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.customFont(font: .firaCode, style: .semiBold, size: .h3))
                .bold()
            }
            .foregroundColor(
                (stat.percentageChange ?? 0) >= 0 ? Color.theme.green: Color.theme.red
            )
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
        .frame(height: 200)
//        .padding()
//        .overlay(
//                RoundedRectangle(cornerRadius: 8)
//                    .stroke(Color.theme.secondaryText, lineWidth: 1)
//            )
        
           
    }
}

#Preview {
    StatisticHomeView(stat: DeveloperPreview.instance.stat1)
}
