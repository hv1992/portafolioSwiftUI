//
//  FormCellAddContactViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import Foundation
import SwiftUI

class FormCellAddContactViewModel : ObservableObject {
    var titleCell : String = ""
    var playgroundText : String = ""
    
    @Published var errorMessage : String = ""
    @Published var information : String = ""
    
    var onChangeText : ((Binding<String>,Binding<String>) -> ())?
   
}
