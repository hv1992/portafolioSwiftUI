//
//  FirebaseFirestoreOptionsView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-23.
//

import SwiftUI

struct FirebaseFirestoreOptionsView: View {
    
    @ObservedObject var viewModel : FirebaseFirestoreOptionsViewModel = FirebaseFirestoreOptionsViewModel()
    
    var body: some View {
        DefaultBackgroundView(containerView: AnyView(
            VStack {
                Text(self.viewModel.titleFirebaseOptions).font(.title)
                    .foregroundColor(.white)
                FirebaseOptionsView(listOptions: self.viewModel.listOptions)
                Spacer()
            }.navigationTitle(self.viewModel.navigationTitle)
        ))
    }
}

#Preview {
    FirebaseFirestoreOptionsView()
}
