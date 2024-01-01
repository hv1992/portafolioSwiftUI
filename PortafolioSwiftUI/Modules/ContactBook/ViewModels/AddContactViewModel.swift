//
//  AddContactViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-21.
//

import Foundation

class AddContactViewModel {
    let titleButtonAddContact : String = "Guardar contacto"
    
    let messageEmailError : String = "Formato email incorrecto"
    let messageNameError : String = "Formato nombre incorrecto"
    let messagePhoneError : String = "Formato telefono incorrecto"
    let messageLastNameError : String = "Formato apellido incorrecto"
    
    let titleMessageAlert : String = "Error guardar contacto"
    let messageAlert : String = "Uno o mas información de contacto, estan incompleto o no tiene el formato correcto"
    
    var existErrorName : Bool = true
    var existErrorLastName : Bool = true
    var existErrorPhone : Bool = true
    var existErrorEmail : Bool = true
    
    var name : String = ""
    var lastName : String = ""
    var phone : String = ""
    var email : String = ""
    
    func verifyIfEmail(emailText: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let isValidEmail = NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: emailText)
        return isValidEmail
    }
    
    func verifyPhoneNumber(phoneNumber : String) -> Bool {
        let phoneRegex = #"^\d{6,10}$"#
        let isValidPhone = NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: phoneNumber)
        return isValidPhone
    }
    
    func verifyNameOrLastName(nameOrLastName : String) -> Bool {
        let nameOrLastNameRegex = #"^[a-zA-Z ]+$"#
        let isValidLastName = NSPredicate(format: "SELF MATCHES %@", nameOrLastNameRegex).evaluate(with: nameOrLastName)
        return isValidLastName
    }
    
    func validateInformation() -> Bool {
        let existErrorFormat = self.existErrorEmail || self.existErrorName || self.existErrorPhone || self.existErrorLastName
        let existEmplyInformations = self.email.isEmpty && self.name.isEmpty && self.lastName.isEmpty && self.phone.isEmpty
        return !existErrorFormat && !existEmplyInformations
    }
    
    func saveContact() {
        let controller = ContactBookPersistenceController.shared
        let contact = Contact(context: controller.container.viewContext)
        contact.name = self.name
        contact.lastName = self.lastName
        contact.phone = self.phone
        contact.email = self.email
        controller.save()
    }
}
