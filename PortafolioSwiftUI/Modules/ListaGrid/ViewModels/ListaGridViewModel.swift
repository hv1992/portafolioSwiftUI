//
//  ListaGripViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2024-12-27.
//

import Foundation
import SwiftUI

class ListaGridViewModel : ObservableObject {
    
    let cantidadMaximoEmojis : Int = 20
    var _showAlert : Bool = false
    var cantidadEmojis : String = ""
    let messageAlert : String
    let titleAlert : String = "Error"
    let messageButton : String = "Entendido"
    let titleCantidadEmojis : String = "Ingrese la cantidad de emojis"
    let titleButtonObtenerEmojis : String = "Obtener emojis"
    
    var result : [EmojiModel] = []
    
    @Published var finalResult : [EmojiModel] = []
    @Published var listGrid : [GridItem] = []
    
    
    var showAlert : Binding<Bool> {
        .init(get: { self._showAlert }, set: { self._showAlert = $0 })
    }
    var textFieldCantidadEmojis : Binding<String> {
        .init(get: { self.cantidadEmojis }, set: { self.cantidadEmojis = $0 })
    }
    
    init() {
        //Tenemos que agregar el mensaje dentro de un constructor para que podamos usar la variable "cantidadMaximoEmojis"
        self.messageAlert = "La cantidad de emojis debe ser mayor a 0 y menor o igual a \(cantidadMaximoEmojis)"
    }
    
    func obtenerListadoEmojis() async {
        
        self._showAlert = false //Establecemos por defecto para que no muestre la alerta
        
        var numerosGrid : Int = Int(self.cantidadEmojis) ?? 0 //Convertimos la cantidad de emojis ingresados por el usuario a número entero
        
        
        
        do {
            //Pregunta si la lista esta vacia, y si se cumple, hace la llamada, y guardamos el resultado en una variable
            if self.result.isEmpty {
                self.result = try await HttpRequest2.shared.requestArrayCodable(urlString: "https://emoji-api.com/emojis", queryUrl: ["access_key":"52e317873346d0765ad8ee3178e4a338673f2c08"])
            }
            
            let countEmojis : Int = result.count //Obtenemos la cantidad total de emojis (esto se hace para facilitar las pruebas)
            
            //Solamente permito que se muestren una cantidad maxima de emojis, y si el servicio entrego una cantidad de emojis
            if numerosGrid <= countEmojis && numerosGrid <= self.cantidadMaximoEmojis {
                
                await MainActor.run {
                    self.listGrid = Array.init(repeating: GridItem(.flexible()), count: numerosGrid) //Creamos un array de GridItem de acuerdo a la cantidad ingresada por el usuario
                    
                    // Hacemos un contador para que carguemos en forma aleatoria los emojis que vamos a mostrar, de acuerdo a la cantidad de emojis que vamos a mostrar
                    for _ in 0..<numerosGrid {
                        self.finalResult.append(self.result[Int.random(in: 0..<countEmojis)])
                    }
                }
            } else {
                //Caso contrario, se muestra el mensaje de alerta
                self._showAlert = true
                return
            }
        } catch {
            print(error)
        }
        
    }
}
