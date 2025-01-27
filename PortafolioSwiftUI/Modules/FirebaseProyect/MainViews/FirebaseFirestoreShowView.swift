//
//  FirebaseFirestoreShowView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-23.
//

import SwiftUI

struct FirebaseFirestoreShowView: View {
    
    @ObservedObject var viewModel : FirebaseFirestoreShowViewModel = FirebaseFirestoreShowViewModel()
    
    private var mostrarAlerta : Binding<Bool> {
        return Binding<Bool>.init(get: { self.viewModel.showAlert
        }, set: {
            self.viewModel.showAlert = $0
        })
    }
    
    var body: some View {
        DefaultBackgroundView(containerView: AnyView(
            VStack {
                Text(self.viewModel.nombreUsuario)
                Text(self.viewModel.apellidoUsuario)
                Text(self.viewModel.correoUsuario)
                Text(self.viewModel.numeroUsuario)
                Spacer()
            }.onAppear {
                self.viewModel.getDataUser()
            }.alert(isPresented: mostrarAlerta) {
                Alert(title: Text("Alerta"), message: Text(self.viewModel.messageAlert))
            }.navigationTitle(self.viewModel.titleNavigationView)
        ))
    }
}
