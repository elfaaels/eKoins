//
//  StatisticOneView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 02/08/24.
//

import SwiftUI

struct StatisticOneView: View {
    let stat: StatisticModel
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4)  {
            Text(stat.value)
                .font(.customFont(font: .pixelifySans, style: .semiBold, size: .h1))
                .foregroundStyle(Color.theme.secondaryText)
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
        
           
    }
}

#Preview {
    StatisticOneView(stat: DeveloperPreview.instance.stat1)
}
