//
//  HistoryView.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 05/10/23.
//

import SwiftUI

struct HistoryView: View {
    @Binding var history: [String] // Histórico agora é uma array de strings
    
    var body: some View {
        List(Array(Set(history)), id: \.self) { item in
            Text(item)
        }
        .navigationBarTitle("Histórico de CEP")
    }
}

//#Preview {
//    HistoryView()
//}
