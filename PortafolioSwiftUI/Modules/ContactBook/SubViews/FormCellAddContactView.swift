//
//  FormCellAddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import Foundation
import SwiftUI

struct FormCellAddContactView : View {
    
    var titleCell : String
    
    @State private var errorMessage : String = ""
    var playgroundText : String = ""
    
    @State var information : String
    
    var body: some View {
        VStack {
            HStack {
                Text(self.titleCell)
                TextField(playgroundText,text: $information)
                    .onChange(of: information) { newInformation in
                        
                    }
            }.frame(height: 35)
            if !errorMessage.isEmpty {
                Text(self.errorMessage)
            }
        }
        
    }
    
}

