//
//  FormAddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import SwiftUI

struct FormAddContactView: View {
    
    @ObservedObject private var viewModel : FormAddContactViewModel = FormAddContactViewModel()
    
    var body: some View {
        VStack {
            FormCellAddContactView(titleCell: self.viewModel.titleName,onChangeText: { (nameTextBinding,errorMessageBinding) in
                self.viewModel.existErrorName = false
                errorMessageBinding.wrappedValue = ""
                self.viewModel.nameContact = errorMessageBinding.wrappedValue
            })
            FormCellAddContactView(titleCell: self.viewModel.titleLastName,onChangeText: { (lastNameTextBinding,errorMessageBinding) in
                self.viewModel.existErrorLastName = false
                errorMessageBinding.wrappedValue = ""
                self.viewModel.lastName = lastNameTextBinding.wrappedValue
            })
            FormCellAddContactView(titleCell: self.viewModel.titlePhone, onChangeText: { (phoneTextBinding,errorMessageBinding) in
                self.viewModel.existErrorPhone = false
                errorMessageBinding.wrappedValue = ""
                self.viewModel.phone = phoneTextBinding.wrappedValue
            })
            FormCellAddContactView(titleCell: self.viewModel.titleEmail, onChangeText: { (emailTextBinding,errorMessageBinding) in
                if self.viewModel.verifyIfEmail(emailText: emailTextBinding.wrappedValue) {
                    self.viewModel.existErrorEmail = false
                    errorMessageBinding.wrappedValue = ""
                    self.viewModel.email = emailTextBinding.wrappedValue
                } else {
                    self.viewModel.existErrorEmail = true
                    errorMessageBinding.wrappedValue = self.viewModel.messageEmailError
                }
            })
        }.padding()
    }
}

#Preview {
    FormAddContactView()
}
