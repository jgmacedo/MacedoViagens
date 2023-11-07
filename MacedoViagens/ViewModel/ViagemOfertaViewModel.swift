//
//  ViagemOfertaViewModel.swift
//  MacedoViagens
//
//  Created by Joao Gabriel Macedo on 03/11/23.
//

import Foundation

class ViagemOfertaViewModel: ViagemViewModel {
    var tituloSessao: String{
        return "Ofertas"
    }
    
    var tipo: viagemViewModelType {
        return .ofertas
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return 1
    }
    
    // MARK : - Init
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
    

}
