//
//  ViagemViewModel.swift
//  MacedoViagens
//
//  Created by Joao Gabriel Macedo on 30/10/23.
//

import Foundation

enum viagemViewModelType: String {
    case destaques
    case internacionais
    case ofertas
}



protocol ViagemViewModel {
    var tituloSessao: String { get }
    var tipo: viagemViewModelType { get }
    var viagens: [Viagem] {get set}
    var numeroDeLinhas: Int { get }
}

