//
//  DefaultCloseButton.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import SwiftUI

struct DefaultCloseButton: View {
    
    var titleButtonClose : String
    var onPressedButton : (() -> ())?
    
    var body: some View {
        Button(action : {
            onPressedButton?()
        }) {
            Label(self.titleButtonClose, systemImage: "xmark.circle.fill").foregroundColor(.white)
        }
    }
}
