//
//  HeaderView.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 05/10/23.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        VStack {
            HStack {
                Image("Logo_Santander_White")
            }

            HStack {
                Text("Pesquisar CEP")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            //.padding(.top, 20)
            .padding(.top, 5)
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(Color("santanderColor"))
    }
}

#Preview {
    HeaderView()
}
