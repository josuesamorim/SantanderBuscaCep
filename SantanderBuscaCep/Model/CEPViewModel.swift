//
//  CEPViewModel.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 05/10/23.
//

import Combine
import Foundation

class CEPViewModel: ObservableObject {
    @Published var history: [String] = []
    @Published var resultText: String = ""
    var cancellables: Set<AnyCancellable> = []
}

