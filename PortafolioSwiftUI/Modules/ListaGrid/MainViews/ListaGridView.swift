//
//  ListaGripView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2024-12-27.
//

import SwiftUI

struct ListaGridView: View {
    @ObservedObject var viewModel : ListaGridViewModel = ListaGridViewModel()
    
    var body: some View {
        DefaultBackgroundView(containerView: AnyView(
            VStack(alignment: .center) {
                Text(self.viewModel.titleCantidadEmojis)
                    .foregroundColor(.white)
                    .font(.title2)
                TextField("",text: self.viewModel.textFieldCantidadEmojis)
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
                        LazyVGrid(columns: self.viewModel.listGrid, spacing: 30) {
                            ForEach(self.viewModel.finalResult){ item in
                                Text(item.character ?? "").font(.system(size: 80))
                            }
                        }
                    }
                }
            }.alert(isPresented: self.viewModel.showAlert) {
                Alert(
                    title: Text(self.viewModel.titleAlert),
                    message: Text(self.viewModel.messageAlert)
                )
            }
        ))
    }
}

#Preview {
    ListaGridView()
}
