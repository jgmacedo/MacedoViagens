//
//  ViagemDestaqueViewModel.swift
//  MacedoViagens
//
//  Created by Joao Gabriel Macedo on 30/10/23.
//

import Foundation


class ViagemDestaqueViewModel: ViagemViewModel{
    var tituloSessao: String {
        return "Destaques"
    
    }
    
    var tipo: viagemViewModelType{
        return .destaques
    }
    
    
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return viagens.count
    }
    
    init(viagens: [Viagem]) {
        self.viagens = viagens
    }
    

    
}
