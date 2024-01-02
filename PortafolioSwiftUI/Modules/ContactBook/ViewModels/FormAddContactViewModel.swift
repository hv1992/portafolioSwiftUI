//
//  FormAddContactViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import Foundation

class FormAddContactViewModel : ObservableObject {
    let titleName : String = "Nombre: "
    let titleLastName : String = "Apellido: "
    let titlePhone : String = "Telefono: "
    let titleEmail : String = "Email: "
    
    var name : String = ""
    var lastName : String = ""
    var phone : String = ""
    var email : String = ""
    
    var emailError : String = ""
    var nameError : String = ""
    var phoneError : String = ""
    var lastNameError : String = ""
}
