//
//  DefaultBackgroundView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2024-12-27.
//

import SwiftUI

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
