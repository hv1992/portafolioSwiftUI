//
//  FirebaseFirestoreEditView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-27.
//

import SwiftUI

struct FirebaseFirestoreEditView: View {
    
    //El .init es tambien una forma de iniciar la variable con una instancia u objeto
    @ObservedObject var viewModel : FirebaseFirestoreEditViewModel = .init()
    
    //Esto es una buena forma para no usar el state, y usar directamente las variables de la clase vista modelo
    var nombreUsuario : Binding<String> {
        return Binding<String>(get: {
            self.viewModel.nombreUsuario
        }, set: { data in
            self.viewModel.nombreUsuario = data
        })
    }
    var apellidoUsuario : Binding<String> {
        return Binding<String>(get: {
            self.viewModel.apellidoUsuario
        }, set: { data in
            self.viewModel.apellidoUsuario = data
        })
    }
    var telefonoUsuario : Binding<String> {
        return Binding<String>(get: {
            self.viewModel.telefonoUsuario
        }, set: { data in
            self.viewModel.telefonoUsuario = data
        })
    }
    
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
                DefaultTextFieldView(titleTextField: self.viewModel.titleNameUser, textEntryTextField: nombreUsuario)
                DefaultTextFieldView(titleTextField: self.viewModel.titleLastnameUser, textEntryTextField: apellidoUsuario)
                DefaultTextFieldView(titleTextField: self.viewModel.titlePhoneUser, typeTextField: .number, textEntryTextField: telefonoUsuario)
                DefaultButtonBlue(titleButton: self.viewModel.titleButtonEditUser, actionButton: {
                    self.viewModel.editDataUser()
                })
            }.padding(.leading,16).padding(.trailing,16)
            .navigationTitle(self.viewModel.titleNavigationView)
            .alert(isPresented: showAlert) {
                Alert(title: Text(self.viewModel.titleAlert), message: Text(self.viewModel.messageAlert))
            }
            .onAppear {
                self.viewModel.getDataUser()
            }
        ))
    }
}
