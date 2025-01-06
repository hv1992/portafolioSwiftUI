//
//  ListaGripViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2024-12-27.
//

import Foundation
import SwiftUI

class ListaGridViewModel : ObservableObject {
    
    let cantidadMaximoEmojis : Int = 10
    let messageAlert : String
    let titleAlert : String = "Error"
    let messageButton : String = "Entendido"
    let titleCantidadEmojis : String = "Ingrese la cantidad de emojis"
    let titleButtonObtenerEmojis : String = "Obtener emojis"
    
    var result : [EmojiModel] = []
    
    @Published var finalResult : [EmojiModel] = []
    @Published var listGrid : [GridItem] = []
    @Published var showAlert : Bool = false
    @Published var cantidadEmojis : String = ""
    
    init() {
        //Tenemos que agregar el mensaje dentro de un constructor para que podamos usar la variable "cantidadMaximoEmojis"
        self.messageAlert = "La cantidad de emojis debe ser mayor a 0 y menor o igual a \(cantidadMaximoEmojis)"
    }
    
    /// función que sirve para obtener el listado de emojis, y mostrar los mismos de forma aleatoria, de acuerdo a la cantidad de emojis solicitados
    func obtenerListadoEmojis() async {
        
        //El MainActor.run es para forzar para ejecutarlo en el hilo principal, pero para ello, la clase tiene que ser de tipo actor
        await MainActor.run {
            self.showAlert = false //Establecemos por defecto para que no muestre la alerta
        }
        
        let numerosGrid : Int = Int(self.cantidadEmojis) ?? 0 //Convertimos la cantidad de emojis ingresados por el usuario a número entero
        
        do {
            //Pregunta si la lista esta vacia, y si se cumple, hace la llamada, y guardamos el resultado en una variable
            if self.result.isEmpty {
                self.result = try await HttpRequest2.shared.requestArrayCodable(urlString: "https://emoji-api.com/emojis", queryUrl: ["access_key":"52e317873346d0765ad8ee3178e4a338673f2c08"])
            }
            
            let countEmojis : Int = result.count //Obtenemos la cantidad total de emojis (esto se hace para facilitar las pruebas)
            
            //Solamente permito que se muestren una cantidad maxima de emojis, y si el servicio entrego una cantidad de emojis
            if numerosGrid <= countEmojis && numerosGrid <= self.cantidadMaximoEmojis {
                
                await MainActor.run {
                    //Se resea la cantidad de emojis a trabajar
                    self.finalResult.removeAll()
                    
                    self.listGrid = Array.init(repeating: GridItem(.flexible()), count: numerosGrid) //Creamos un array de GridItem de acuerdo a la cantidad ingresada por el usuario
                    
                    // Hacemos un contador para que carguemos en forma aleatoria los emojis que vamos a mostrar, de acuerdo a la cantidad de emojis que vamos a mostrar
                    for _ in 0..<numerosGrid {
                        self.finalResult.append(self.result[Int.random(in: 0..<countEmojis)])
                    }
                }
            } else {
                //Caso contrario, se muestra el mensaje de alerta
                await MainActor.run {
                    self.showAlert = true
                }
                return
            }
        } catch {
            print(error)
        }
        
    }
    
    /// Se resea los valores a valores por defecto
    func resetValues() {
        self.cantidadEmojis = ""
        self.result.removeAll()
        
        self.finalResult = []
        self.listGrid = []
        self.showAlert = false
        self.cantidadEmojis = ""
    }
}
