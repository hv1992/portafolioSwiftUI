//
//  ListaGripViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2024-12-27.
//

import Foundation
import SwiftUI

class ListaGridViewModel : ObservableObject {
    
    @Published var cantidadEmojis : String = ""
    @Published var listGrid : [GridItem] = []
    
    var textFieldCantidadEmojis : Binding<String> {
        .init(get: { self.cantidadEmojis }, set: { self.cantidadEmojis = $0 })
    }
    
    let titleCantidadEmojis : String = "Ingrese la cantidad de emojis"
    
    let titleButtonObtenerEmojis : String = "Obtener emojis"
    
    func obtenerListadoEmojis() {
        var numerosGrid : Int = Int(self.cantidadEmojis) ?? 0
        
        self.listGrid = Array.init(repeating: GridItem(.flexible()), count: numerosGrid)
    }
}
