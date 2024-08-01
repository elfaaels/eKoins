//
//  SettingsView.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 01/08/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("ABOUT THE APP"),
                        footer: HStack {
                    Spacer()
                    Text("Copyright All Right Reserved")
                    Spacer()
                }
                    .padding(.vertical, 8)
                ) {
                    CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "eKoins", rowTintColor: .blue)
                    CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS", rowTintColor: .red)
                    CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift, SwiftUI", rowTintColor: .orange)
                    CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0.0", rowTintColor: .purple)
                    CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Elfaael", rowTintColor: .mint)
                    CustomListRowView(rowLabel: "Designer", rowIcon: "chevron.compact.right", rowContent: "Elfaael", rowTintColor: .pink)
                    CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: "elfaael.webflow.io", rowTintColor: .indigo) //TODO: Change to eKoins Webflow Site
                    CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintColor: .pink, rowLinkLabel: "My Website", rowLinkDestination: "https://elfaael.webflow.io")
                    
                    
                }
                
            }
            .navigationTitle("Information")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isPresented = false
                }, label: {
                        Image(systemName: "xmark")
                        .font(.headline)
                })
                }
            }
        }
    }
}

#Preview {
    SettingsView(isPresented: .constant(false))
}
