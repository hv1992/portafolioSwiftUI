//
//  AddContactViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-21.
//

import Foundation

class AddContactViewModel {
    let titleButtonAddContact : String = "Guardar contacto"
    
    let messageEmailError : String = "Formato Email incorrecto"
    let messageNameError : String = ""
    let messagePhoneError : String = ""
    let messageLastNameError : String = ""
    
    var existErrorName : Bool = false
    var existErrorLastName : Bool = false
    var existErrorPhone : Bool = false
    var existErrorEmail : Bool = false
    
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
        let isValidPhone = NSPredicate(format: "SELF MATCHES %@", nameOrLastNameRegex).evaluate(with: nameOrLastName)
        return isValidPhone
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
