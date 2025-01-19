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
                    NavigationLink(destination: RandomDogView()) {
                        view
                    }
                } else if view.viewModel.firebaseOption == .storage {
                    NavigationLink(destination: RandomDogView()) {
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
