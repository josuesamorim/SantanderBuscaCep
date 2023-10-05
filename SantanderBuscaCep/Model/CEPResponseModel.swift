//
//  CEPResponseModel.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 05/10/23.
//

import Foundation

struct CEPResponseModel: Codable {
    let logradouro: String
    let bairro: String
    let localidade: String
    let uf: String

    var fullAddress: String {
        return "\(logradouro), \(bairro), \(localidade) - \(uf)"
    }
}
