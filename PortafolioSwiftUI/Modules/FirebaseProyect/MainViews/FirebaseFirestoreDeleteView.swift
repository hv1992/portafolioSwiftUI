//
//  FirebaseFirestoreDeleteView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-28.
//

import SwiftUI

struct FirebaseFirestoreDeleteView: View {
    
    @ObservedObject var viewModel : FirebaseFirestoreDeleteViewModel = .init()
    
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
                Text(self.viewModel.messageDelete)
                DefaultButtonBlue(titleButton: self.viewModel.titleButtonDelete,actionButton:  {
                    self.viewModel.deleteUser()
                })
            }
            .navigationTitle(self.viewModel.titleNavigationView)
            .alert(isPresented: showAlert) {
                Alert(title: Text(self.viewModel.titleAlert), message: Text(self.viewModel.messageAlert))
            }
        ))
    }
}

#Preview {
    FirebaseFirestoreDeleteView()
}
