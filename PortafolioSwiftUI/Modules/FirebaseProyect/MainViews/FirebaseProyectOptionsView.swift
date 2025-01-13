//
//  FirebaseProyectOptionsView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-10.
//

import SwiftUI

struct FirebaseProyectOptionsView: View {
    
    @ObservedObject var viewModel : FirebaseProyectOptionsViewModel = FirebaseProyectOptionsViewModel()
    
    var body: some View {
        DefaultBackgroundView(containerView: AnyView(
            VStack {
                FirebaseOptionsView(listOptions: self.viewModel.listOptions)
                Spacer()
            }
            
        ))
    }
}

#Preview {
    FirebaseProyectOptionsView()
}
