//
//  DefaultButtonWhite.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import SwiftUI

struct DefaultButtonWhite: View {
    var titleButton : String = "Prueba"
    var actionButton : (() -> ())?
    
    var body: some View {
        Button(action: self.actionButton ?? {}, label: {
            Text(titleButton).padding(.all,8.0)
        })
        .background(Color.white.ignoresSafeArea())
        .cornerRadius(8)
        .foregroundColor(Color.blue)
    }
}

#Preview {
    DefaultButtonWhite()
}
