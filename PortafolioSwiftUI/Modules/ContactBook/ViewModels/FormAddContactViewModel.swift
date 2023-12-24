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
    
    let messageEmailError : String = "Formato Email incorrecto"
    let messageNameError : String = ""
    let messagePhoneError : String = ""
    let messageLastNameError : String = ""
    
    @Published var nameContact : String = ""
    @Published var lastName : String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    
    @Published var existErrorName : Bool = false
    @Published var existErrorLastName : Bool = false
    @Published var existErrorPhone : Bool = false
    @Published var existErrorEmail : Bool = false
    
    func verifyIfEmail(emailText: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let isValidEmail = NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: emailText)
        return isValidEmail
    }
    
    func verifyPhoneNumber(phoneNumber : String) -> Bool {
        return true
    }
    
    func verifyNameOrLastName(nameOrLastName : String) -> Bool {
        return true
    }
    
}
