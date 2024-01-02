//
//  AddContactViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-21.
//

import Foundation

class AddContactViewModel {
    let titleButtonAddContact : String = "Guardar contacto"
    
    var existErrorName : Bool = false
    var existErrorLastName : Bool = false
    var existErrorPhone : Bool = false
    var existErrorEmail : Bool = false
    
    var messageEmailError : String {
        if existErrorEmail {
            return "Formato email incorrecto"
        } else {
            return ""
        }
    }
    var messageNameError : String {
        if existErrorName {
            return "Formato nombre incorrecto"
        } else {
            return ""
        }
        
    }
    var messagePhoneError : String {
        if existErrorPhone {
            return "Formato telefono incorrecto"
        } else {
            return ""
        }
    }
    var messageLastNameError : String {
        if existErrorLastName {
            return "Formato apellido incorrecto"
        } else {
            return ""
        }
    }
    
    let titleMessageAlert : String = "Error guardar contacto"
    let messageAlert : String = "Uno o mas información de contacto, estan incompleto o no tiene el formato correcto"
    
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
