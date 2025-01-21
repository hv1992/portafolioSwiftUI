//
//  FirebaseFirestoreAddInformationView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-20.
//

import SwiftUI

struct FirebaseFirestoreAddInformationView: View {
    
    @ObservedObject var viewModel = FirebaseFirestoreAddInformationViewModel()
    
    
    var body: some View {
        
        DefaultBackgroundView(containerView: AnyView(
            VStack {
                Text("Hola")
            }
        ))
    }
}

#Preview {
    FirebaseFirestoreAddInformationView()
}
