//
//  FormAddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import SwiftUI

struct FormAddContactView: View {
    
    private var viewModel : FormAddContactViewModel
    
    var onChangeNameText: ( (Binding<String>,Binding<String>) -> Void)?
    var onChangeLastNameText: ( (Binding<String>,Binding<String>) -> Void)?
    var onChangePhoneText: ( (Binding<String>,Binding<String>) -> Void)?
    var onChangeEmailText: ( (Binding<String>,Binding<String>) -> Void)?
    
    init(onChangeNameText: ( (Binding<String>, Binding<String>) -> Void)? = nil, onChangeLastNameText: ( (Binding<String>, Binding<String>) -> Void)? = nil, onChangePhoneText: ( (Binding<String>, Binding<String>) -> Void)? = nil, onChangeEmailText: ( (Binding<String>, Binding<String>) -> Void)? = nil,
        name : String = "",lastName : String = "",phone : String = "",email : String = "",
        errorName : String = "",errorLastName : String = "",errorPhone : String = "",errorEmail : String = "") {
        self.viewModel = FormAddContactViewModel()
        self.onChangeNameText = onChangeNameText
        self.onChangeLastNameText = onChangeLastNameText
        self.onChangePhoneText = onChangePhoneText
        self.onChangeEmailText = onChangeEmailText
        self.viewModel.name = name
        self.viewModel.lastName = lastName
        self.viewModel.phone = phone
        self.viewModel.email = email
        self.viewModel.nameError = errorName
        self.viewModel.lastNameError = errorLastName
        self.viewModel.phoneError = errorPhone
        self.viewModel.emailError = errorEmail
    }
    
    var body: some View {
        VStack {
            FormCellAddContactView(titleCell: self.viewModel.titleName,information: self.viewModel.name,errorMessage: self.viewModel.nameError,onChangeText: onChangeNameText)
            FormCellAddContactView(titleCell: self.viewModel.titleLastName,information: self.viewModel.lastName,errorMessage: self.viewModel.lastNameError,onChangeText: onChangeLastNameText)
            FormCellAddContactView(titleCell: self.viewModel.titlePhone,information: self.viewModel.phone,errorMessage: self.viewModel.phoneError,onChangeText: onChangePhoneText)
            FormCellAddContactView(titleCell: self.viewModel.titleEmail,information: self.viewModel.email,errorMessage: self.viewModel.emailError,onChangeText: onChangeEmailText)
        }.padding()
    }
}

#Preview {
    FormAddContactView()
}
