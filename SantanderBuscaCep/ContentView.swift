//
//  ContentView.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var searchView = SearchView()
    
    var body: some View {
        VStack {
        HeaderView()
        SearchView()
        }
    }
}

#Preview {
    ContentView()
}
