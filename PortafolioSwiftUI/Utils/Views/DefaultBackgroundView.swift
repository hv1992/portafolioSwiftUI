//
//  DefaultBackgroundView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2024-12-27.
//

import SwiftUI

/// Diseño por defecto del fondo de proyecto, de tal manera para mantener el mismo fondo el todo el proyecto.
struct DefaultBackgroundView: View {
    
    var containerView : AnyView?
    var body: some View {
        ZStack {
            Colors.defaultBackgroundColor
            containerView
        }
    }
}

#Preview {
    DefaultBackgroundView()
}
