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
            }
        ))
    }
}

#Preview {
    ListaGridView()
}
