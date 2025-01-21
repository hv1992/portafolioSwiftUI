//
//  DefaultTextFieldView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-20.
//

import SwiftUI

enum TypeDefaultTextField {
    case email
    case onlyText
    case password
    case number
    case passwordOnlyNumber
}

struct DefaultTextFieldView: View {
    var titleTextField : String = ""
    var typeTextField : TypeDefaultTextField = .onlyText
    
    var textEntryTextField : Binding<String>
    
    /// Configuración inicial del textField por defecto
    /// - Parameters:
    ///   - titleTextField: la información a completar en el campo
    ///   - typeTextField: el tipo de información que se va a ingresar
    ///   - textEntryTextField: el binding donde se va a almacenar la información que ingresa el usuario
    init(titleTextField: String, typeTextField: TypeDefaultTextField = .onlyText, textEntryTextField: Binding<String>) {
        self.titleTextField = titleTextField
        self.typeTextField = typeTextField
        self.textEntryTextField = textEntryTextField
    }
    
    var body: some View {
        if typeTextField == .email {
            TextField(titleTextField, text: textEntryTextField)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
        } else if typeTextField == .onlyText {
            TextField(titleTextField, text: textEntryTextField)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.default)
                .disableAutocorrection(true)
        } else if typeTextField == .password {
            SecureField(titleTextField, text: textEntryTextField)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.default)
                .disableAutocorrection(true)
        } else if typeTextField == .number {
            TextField(titleTextField, text: textEntryTextField)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .disableAutocorrection(true)
        } else if typeTextField == .passwordOnlyNumber {
            SecureField(titleTextField, text: textEntryTextField)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.default)
                .disableAutocorrection(true)
        }
    }
}
