//
//  DefaultButton1.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import SwiftUI

struct DefaultButtonBlue: View {
    var titleButton : String = "Prueba"
    var actionButton : (() -> ())?
    
    var body: some View {
        Button(action: self.actionButton ?? {}, label: {
            Text(titleButton).padding(.all,8.0)
        })
        .background(Color.blue.opacity(0.8).ignoresSafeArea())
        .cornerRadius(8)
        .foregroundColor(Color.white)
    }
}

#Preview {
    DefaultButtonBlue()
}
