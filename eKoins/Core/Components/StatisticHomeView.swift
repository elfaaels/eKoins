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
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack (spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
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
        .padding()
        .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.blue, lineWidth: 2)
            )
        
           
    }
}

#Preview {
    StatisticHomeView(stat: DeveloperPreview.instance.stat1)
}
