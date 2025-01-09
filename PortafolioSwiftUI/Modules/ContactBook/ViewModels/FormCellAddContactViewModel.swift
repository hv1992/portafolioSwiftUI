//
//  FormCellAddContactViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import Foundation
import SwiftUI

//ObservableObject: Forma parte de la clase Combine, y es como un subgrupo del State. El mismo sirve de mantener los valores que se van a usar en la vista, pero cuando la vista se vuelve a refrescar, los valores vuelven a resetearse.
//Published: Es la forma de identificar las variables que pueden usar las vistas para leer y escribir valores, para el caso de que la clase herede de ObservableObject. Los que no tiene el mismo, solamente sirve para funcione las variables dentro de la clase.

class FormCellAddContactViewModel : ObservableObject {
    var titleCell : String = ""
    var playgroundText : String = ""
    
    @Published var errorMessage : String = ""
    @Published var information : String = ""
    
    var onChangeText : ((Binding<String>,Binding<String>) -> ())?
   
}
