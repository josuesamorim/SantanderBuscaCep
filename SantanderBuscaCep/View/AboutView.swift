//
//  AboutView.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 06/10/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                Image("Logo_Bootcamp")
            }
            VStack {
                Image("Logo_Dio")
                    .resizable()
                    .frame(width: 100, height: 40)
                
                Text(verbatim: "www.dio.me/users/josuedesouzaamorim")
                    .foregroundColor(.white)
                   
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Preenche toda a tela
        .background(Color.santander)
        .ignoresSafeArea() // Ignora a área segura (notch, barra de status, etc.)
    }
}


#Preview {
    AboutView()
}
