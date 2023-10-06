//
//  TabView.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 06/10/23.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 0
    @State private var history: [String] = []
    
    var body: some View {

            TabView(selection: $selectedTab) {
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Pesquisar CEP")
                    }
                    .tag(0)
                
                AboutView()
                    .tabItem {
                        Image(systemName: "clock")
                        Text("Sobre")
                    }
                    .tag(1)
            }
            .foregroundColor(Color.white)
    }
}

#Preview {
    TabBarView()
}
