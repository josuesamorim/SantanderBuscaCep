//
//  HeaderView.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 05/10/23.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        
        HStack {
            Image("Logo_Santander_White")
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(Color("santanderColor"))
        
    }
}

#Preview {
    HeaderView()
}
