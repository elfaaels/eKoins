//
//  StatisticView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 27/07/24.
//

import SwiftUI

struct StatisticView: View {
    let stat: StatisticModel
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4)  {
            Text(stat.title)
                .font(.customFont(font: .firaCode, style: .semiBold, size: .h3))
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.customFont(font: .firaCode, style: .regular, size: .h3))
                .foregroundColor(Color.theme.accent)
            HStack (spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.customFont(font: .firaCode, style: .light, size: .h3))
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180 ))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                .bold()
            }
            .foregroundColor(
                (stat.percentageChange ?? 0) >= 0 ? Color.theme.green: Color.theme.red
            )
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
        
           
    }
}

#Preview {
    StatisticView(stat: DeveloperPreview.instance.stat1)
}
