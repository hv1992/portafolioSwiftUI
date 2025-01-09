//
//  ListaGripView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2024-12-27.
//

import SwiftUI

struct ListaGridView: View {
    @ObservedObject var viewModel : ListaGridViewModel = ListaGridViewModel()
    
    //Los binding no se pueden agregar, por lo que yo se, fuera de las vistas, por lo que se ponen aqui, pero los contenedores de valores estan en la vista modelo.
    var showAlert : Binding<Bool> {
        .init(get: { self.viewModel.showAlert }, set: { self.viewModel.showAlert = $0 })
    }
    var textFieldCantidadEmojis : Binding<String> {
        .init(get: { self.viewModel.cantidadEmojis }, set: { self.viewModel.cantidadEmojis = $0 })
    }
    
    var body: some View {
        DefaultBackgroundView(containerView: AnyView(
            VStack(alignment: .center) {
                Text(self.viewModel.titleCantidadEmojis)
                    .foregroundColor(.white)
                    .font(.title2)
                TextField("",text: self.textFieldCantidadEmojis)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 50)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                DefaultButtonBlue(titleButton: self.viewModel.titleButtonObtenerEmojis, actionButton: {
                    Task { //Aqui estoy indicando que voy a ejecutar una instruccion asincrona
                        await self.viewModel.obtenerListadoEmojis()
                    }
                })
                if self.viewModel.listGrid.isEmpty {
                    Spacer()
                } else {
                    ScrollView(){
                        if self.viewModel.posListGrid == 0 {
                            //En este caso, los elementos estan como columnas
                            LazyVGrid(columns: self.viewModel.listGrid, spacing: 10) {
                                ForEach(self.viewModel.finalResult){ item in
                                    Text(item.character ?? "")
                                }
                            }
                        } else if self.viewModel.posListGrid == 1 {
                            //En este caso, los elementos estan como filas
                            LazyHGrid(rows: self.viewModel.listGrid, alignment: .center, spacing: 10) {
                                ForEach(self.viewModel.finalResult){ item in
                                    Text(item.character ?? "")
                                }
                            }
                        }
                    }
                }
            }.alert(isPresented: self.showAlert) {
                Alert(
                    title: Text(self.viewModel.titleAlert),
                    message: Text(self.viewModel.messageAlert)
                )
            }.onAppear {
                //Resea los valores por defecto
                self.viewModel.resetValues()
            }.navigationBarTitle(self.viewModel.titleNavigationView)
            //El toolbar es la zona del navigación bar, hacia el costado derecho del mismo.
            .toolbar {
                //El toolbar item es que agregamos un botón al toolbar
                ToolbarItem{
                    //Agregamos un elemento de menu, y dentro del mismo, agregamos las opciones
                    Menu(self.viewModel.titleToolbar){
                        Section{
                            Button(self.viewModel.titleOptionsToolbar[0]){
                                self.viewModel.posListGrid = 0
                            }
                            Button(self.viewModel.titleOptionsToolbar[1]){
                                self.viewModel.posListGrid = 1
                            }
                        }
                    }
                    //Establece el color del botón menu
                    .accentColor(Color.white)
                }
            }
        ))
    }
}

#Preview {
    ListaGridView()
}
