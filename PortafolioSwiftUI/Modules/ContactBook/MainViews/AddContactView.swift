//
//  AddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-21.
//

import SwiftUI

struct AddContactView: View {
    
    @ObservedObject private var viewModel = AddContactViewModel()
    
    //El @Envoronment sirve para obtener un valor de esta vista, que en este caso, el valor a obtener el modo de presentación
    @Environment(\.presentationMode) var back
    
    var body: some View {
        ZStack {
            Colors.defaultBackgroundColor
            VStack {
                HStack {
                    TitleAddContactView(viewModel: self.viewModel)
                        .padding()
                    Spacer()
                        .frame(width: 20)
                    HStack {
                        Button(action : {
                            back.wrappedValue.dismiss()
                        }) {
                            Label(self.viewModel.titleButtonClose, systemImage: "xmark.circle.fill").foregroundColor(.white)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    AddContactView()
}