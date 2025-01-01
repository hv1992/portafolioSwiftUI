//
//  FormCellAddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import Foundation
import SwiftUI

struct FormCellAddContactView : View {
    
    //ObservedObject: sirve para definir que la variable va a almacenar un objeto, que hereda de la clase ObservableObject
    
    /*La diferencia entre el ObserverObject y el StateObject es que: imaginemos que tenemos dos vista con un objeto de la misma clase, y que dentro de tiene una variable que vamos a usar con un textField. Por ejemplo
     
     var body: some View {
         VStack {
             Text(self.pruebaModelo.temporalValor)
             TextField("Hola", text: text).padding()
             Vista2()
             Button("Cambiar") {
                 self.pruebaModelo.temporalValor = ""
             }
         }
     }
     
     La Vista2 tiene el mismo Text y TextField y funciona de la misma manera.
     
     Cuando presionamos el botón, en caso de que la variable pruebaModelo este en ambos como @ObservedObject, tanto en la vista principal como Vista2, van a vaciarse la variable temporalValor, pero si se coloca en la variable pruebaModelo el @StateObject para la segunda vista, al presionar el botón, solamente se vacia el de la otra vista.
     
    */
    @ObservedObject private var viewModel : FormCellAddContactViewModel
    
    var information : Binding<String> {
        return Binding<String>(get: {self.viewModel.information}, set: {
            self.viewModel.information = $0 })
    }
    
    var errorMessage : Binding<String> {
        return Binding<String>(get: {self.viewModel.errorMessage}, set: {
            self.viewModel.errorMessage = $0 })
    }
    
    init(titleCell: String = "", information : String = "",errorMessage: String = "", playgroundText: String = "", onChangeText: ( (Binding<String>,Binding<String>) -> Void)?) {
        let viewModelTemp = FormCellAddContactViewModel()
        viewModelTemp.titleCell = titleCell
        viewModelTemp.information = information
        viewModelTemp.errorMessage = errorMessage
        viewModelTemp.playgroundText = playgroundText
        viewModelTemp.onChangeText = onChangeText
        self.viewModel = viewModelTemp
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(self.viewModel.titleCell)
                TextField(self.viewModel.playgroundText,text: self.information)
                    .onChange(of: self.viewModel.information) { newInformation in
                        self.viewModel.onChangeText?(information,errorMessage)
                    }
            }.frame(height: 20)
            if !self.viewModel.errorMessage.isEmpty {
                Text(self.viewModel.errorMessage)
                    .font(.footnote)
                    .foregroundColor(.red)
                    .frame(height: 12)
            }
        }
        
    }
    
}

