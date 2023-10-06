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
            
            HistoryView(history: $history)
                .tabItem {
                    Image(systemName: "clock")
                    Text("Histórico")
                }
                .tag(1)
        }
    }
}

#Preview {
    TabBarView()
}
