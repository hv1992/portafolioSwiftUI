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
    
    func obtenerListadoEmojis() async {
        var numerosGrid : Int = Int(self.cantidadEmojis) ?? 0
        
        self.listGrid = Array.init(repeating: GridItem(.flexible()), count: numerosGrid)
        
        do {
            var result : [EmojiModel] = try await HttpRequest2.shared.requestArrayCodable(urlString: "https://emoji-api.com/emojis", queryUrl: ["access_key":"52e317873346d0765ad8ee3178e4a338673f2c08"])
            
            print("hola")
        } catch {
            print(error)
        }
        
    }
}
