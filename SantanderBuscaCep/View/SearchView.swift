//
//  SearchView.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 05/10/23.
//

import SwiftUI
import Combine

struct SearchView: View {
    @State private var cep = ""
    @State private var resultText = ""
    @State private var history: [String] = []
    @State var showingHistory = false
    @State private var cancellables: Set<AnyCancellable> = []
    @State private var isEditing: Bool = false
    @ObservedObject var cepViewModel = CEPViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Text(cepViewModel.resultText)
                    .padding()
                
                TextField("Digite um CEP", text: $cep)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onReceive(Just(cep).debounce(for: 0.5, scheduler: RunLoop.main)) { _ in
                        fetchAndHandleCep(cep: cep)
                    }
                    .keyboardType(.numberPad)
                    .onTapGesture { isEditing = true }
                
                
                Button("Pesquisar") {
                    fetchAndHandleCep(cep: cep)
                    hideKeyboard()
                }
                .padding()
                .background(Color.santander)
                .cornerRadius(3.0)
                .foregroundColor(.white)
                
            }
            
            .navigationBarItems(trailing: Button("Histórico") {
                showingHistory = true
            })
            .foregroundColor(.black)
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
    //.background(.santanderGray).ignoresSafeArea(.all)
    
    
    
    func fetchAndHandleCep(cep: String) {
        Api.fetchAndHandleCep(cep: cep, viewModel: cepViewModel)
    }
    
    
    func fetchCep(cep: String) -> AnyPublisher<CEPResponseModel, Error> {
        return Api.fetchCep(cep: cep)
    }
    
    func hideKeyboard() {
        if isEditing {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            isEditing = false
        }
    }
}

#Preview {
    SearchView()
}
