//
//  FirebaseAuthView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-15.
//

import Foundation
import SwiftUI

struct FirebaseAuthView: View {
    
    @State private var usuarioText : String = ""
    @State private var passwordText : String = ""
    
    @ObservedObject private var viewModel: FirebaseAuthViewModel = FirebaseAuthViewModel()
    
    private var mostrarAlerta : Binding<Bool> {
        return Binding<Bool>.init(get: { self.viewModel.mostrarAlerta
        }, set: {
            self.viewModel.mostrarAlerta = $0
        })
    }
    
    var body: some View {
        
        DefaultBackgroundView(containerView: AnyView(
            VStack(alignment: .center) {
                Text(self.viewModel.titleFirstCamp).font(.title2)
                TextField(self.viewModel.titleFirstCamp, text: $usuarioText)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                Text(self.viewModel.titleSecondCamp).font(.title2)
                TextField(self.viewModel.titleSecondCamp, text: $passwordText)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                HStack {
                    DefaultButtonBlue(titleButton: self.viewModel.titleFirstButton) {
                        self.viewModel.signInt(email: self.usuarioText, password: self.passwordText)
                    }
                    DefaultButtonBlue(titleButton: self.viewModel.titleSecondButton) {
                        self.viewModel.signOut()
                    }
                }
            }.padding(.leading, 16).padding(.trailing, 16)
                .navigationTitle(self.viewModel.titleNavigationBar)
                .alert(isPresented: mostrarAlerta) {
                    Alert(title: Text("Error"), message: Text(self.viewModel.mensajeAlerta))
                }
        ))
        
    }
}

#Preview {
    FirebaseAuthView()
}

