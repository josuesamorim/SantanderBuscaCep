//
//  Api.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 05/10/23.
//

import Foundation
import Combine


class Api {
    static func fetchCep(cep: String) -> AnyPublisher<CEPResponseModel, Error> {
        let viaCEPURL = "https://viacep.com.br/ws/\(cep)/json/"
        
        return URLSession.shared.dataTaskPublisher(for: URL(string: viaCEPURL)!)
            .map(\.data)
            .decode(type: CEPResponseModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func fetchAndHandleCep(cep: String, viewModel: CEPViewModel) {
        fetchCep(cep: cep)
            .receive(on: DispatchQueue.main) // Garante que as atualizações sejam feitas na thread principal
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Erro na solicitação HTTP: \(error)")
                }
            }, receiveValue: { cepResponse in
                let address = "\(cepResponse.logradouro), \(cepResponse.bairro), \(cepResponse.localidade) - \(cepResponse.uf)"
                viewModel.resultText = address
                
                // Armazene o CEP e o endereço completo no histórico
                let historyItem = "\(cep) - \(address)"
                viewModel.history.insert(historyItem, at: 0)
                UserDefaults.standard.set(viewModel.history, forKey: "CEPHistory")
            })
            .store(in: &viewModel.cancellables)
    }
}
