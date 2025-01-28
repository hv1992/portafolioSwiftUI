//
//  FirebaseOptionsView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-11.
//

import SwiftUI

struct FirebaseOptionsView: View {
    
    @ObservedObject var viewModel : FirebaseOptionsViewModel
    
    init(listOptions : [FirebaseOptionView]) {
        self.viewModel = FirebaseOptionsViewModel()
        self.viewModel.listOptions = listOptions
    }
    
    var body: some View {
        VStack {
            ForEach(viewModel.listOptions) { view in
                if view.viewModel.firebaseOption == .auth {
                    NavigationLink(destination: FirebaseAuthView()) {
                        view
                    }
                } else if view.viewModel.firebaseOption == .firestore {
                    NavigationLink(destination: FirebaseFirestoreOptionsView()) {
                        view
                    }
                } else if view.viewModel.firebaseOption == .firestoreAdd {
                    NavigationLink(destination: FirebaseFirestoreAddInformationView()) {
                        view
                    }
                } else if view.viewModel.firebaseOption == .firestoreShow {
                    NavigationLink(destination: FirebaseFirestoreShowView()) {
                        view
                    }
                } else if view.viewModel.firebaseOption == .firestoreUpdate {
                    NavigationLink(destination: FirebaseFirestoreEditView()) {
                        view
                    }
                }
            }
        }
    }
}

#Preview {
    FirebaseOptionsView(listOptions: [])
}
