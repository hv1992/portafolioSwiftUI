//
//  FirebaseFirestoreAddInformationView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-20.
//

import SwiftUI

struct FirebaseFirestoreAddInformationView: View {
    
    @ObservedObject var viewModel = FirebaseFirestoreAddInformationViewModel()
    
    @State var nombreUsuario : String = ""
    @State var apellidoUsuario : String = ""
    @State var telefonoUsuario : String = ""
    
    var showAlert : Binding<Bool> {
        Binding<Bool>.init(get: {
            self.viewModel.showAlert
        }, set: {
            self.viewModel.showAlert = $0
        })
    }
    
    var body: some View {
        
        DefaultBackgroundView(containerView: AnyView(
            VStack {
                DefaultTextFieldView(titleTextField: self.viewModel.titleNameUser, textEntryTextField: $nombreUsuario)
                DefaultTextFieldView(titleTextField: self.viewModel.titleLastnameUser, textEntryTextField: $apellidoUsuario)
                DefaultTextFieldView(titleTextField: self.viewModel.titlePhoneUser, typeTextField: .number, textEntryTextField: $telefonoUsuario)
                DefaultButtonBlue(titleButton: self.viewModel.titleButtonSaveUser, actionButton: {
                    self.viewModel.guardarDatos(nombreUsuario: nombreUsuario, apellidoUsuario: apellidoUsuario, telefonoUsuario: telefonoUsuario)
                })
            }.padding(.leading,16).padding(.trailing,16)
                .navigationTitle(self.viewModel.titleNavigationView)
                .alert(isPresented: showAlert) {
                    Alert(title: Text("Error"), message: Text(self.viewModel.messageAlert))
                }
        ))
    }
}

#Preview {
    FirebaseFirestoreAddInformationView()
}
