//
//  FormCellAddContactViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import Foundation

class FormCellAddContactViewModel : ObservableObject {
    var titleCell : String = ""
    var playgroundText : String = ""
    
    @Published var errorMessage : String = ""
    @Published var information : String = ""
    
    var onChangeText : ((String) -> ())? = nil
   
}
