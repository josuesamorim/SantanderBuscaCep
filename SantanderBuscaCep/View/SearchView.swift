//
//  SearchView.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 05/10/23.
//

import SwiftUI

import SwiftUI
import Combine

struct SearchView: View {
    @State private var cep = ""
    @State private var resultText = ""
    @State private var history: [String] = [] // Histórico agora é uma array de strings
    @State  var showingHistory = false // Flag para mostrar a tela de histórico
    @State private var cancellables: Set<AnyCancellable> = []
    @ObservedObject var cepViewModel = CEPViewModel() // Use o ViewModel
    
    var body: some View {
        NavigationView {
            
            
            
            VStack {
                
                HeaderView()
                
                Spacer(minLength: 10)
                
                Text(cepViewModel.resultText)
                    .padding()
                
                TextField("Digite um CEP", text: $cep)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onReceive(Just(cep).debounce(for: 0.5, scheduler: RunLoop.main)) { _ in
                        fetchAndHandleCep(cep: cep)
                    }
                
                Button("Pesquisar") {
                    fetchAndHandleCep(cep: cep)
                }
                .padding()
                
                
                
            }
            //.navigationBarTitle("Consulta de CEP")
            .navigationBarItems(trailing: Button("Histórico") {
                showingHistory = true
            })
            .foregroundColor(.white)
            .sheet(isPresented: $showingHistory) {
                NavigationView {
                    HistoryView(history: $cepViewModel.history)
                }
            }
        }
        .onAppear {
            cepViewModel.history = UserDefaults.standard.stringArray(forKey: "CEPHistory") ?? []
        }
    }
    
    func fetchAndHandleCep(cep: String) {
        Api.fetchAndHandleCep(cep: cep, viewModel: cepViewModel)
    }
    
    
    func fetchCep(cep: String) -> AnyPublisher<CEPResponseModel, Error> {
        return Api.fetchCep(cep: cep)
    }
}

#Preview {
    SearchView()
}
