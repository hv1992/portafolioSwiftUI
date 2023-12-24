//
//  FormAddContactViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import Foundation

class FormAddContactViewModel : ObservableObject {
    var titleName : String = "Nombre: "
    var titleLastName : String = "Apellido: "
    var titlePhone : String = "Telefono: "
    var titleEmail : String = "Email: "
    
    @Published var nameContact : String = ""
    @Published var lastName : String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    
    
    
}
