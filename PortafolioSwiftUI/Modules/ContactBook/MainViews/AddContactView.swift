//
//  AddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-21.
//

import SwiftUI

struct AddContactView: View {
    
    private var viewModel = AddContactViewModel()
    
    //El @Envoronment sirve para obtener un valor de esta vista, que en este caso, el valor a obtener el modo de presentación
    @Environment(\.presentationMode) var back
    
    @State private var showAlert : Bool = false
    
    var body: some View {
        ZStack {
            Colors.defaultBackgroundColor
            VStack {
                HStack {
                    TitleAddContactView()
                        .padding()
                    Spacer()
                        .frame(width: 20)
                    DefaultCloseButton(onPressedButton: {
                        back.wrappedValue.dismiss()
                    })
                }
                FormAddContactView(onChangeNameText: { (informationText,errorText) in
                    let isValid = self.viewModel.verifyNameOrLastName(nameOrLastName: informationText.wrappedValue)
                    self.viewModel.existErrorName = !isValid
                    if isValid {
                        errorText.wrappedValue = ""
                        self.viewModel.name = informationText.wrappedValue
                    } else {
                        errorText.wrappedValue = self.viewModel.messageNameError
                    }
                },onChangeLastNameText: { (informationText,errorText) in
                    let isValid = self.viewModel.verifyNameOrLastName(nameOrLastName: informationText.wrappedValue)
                    self.viewModel.existErrorLastName = !isValid
                    if isValid {
                        errorText.wrappedValue = ""
                        self.viewModel.lastName = informationText.wrappedValue
                    } else {
                        errorText.wrappedValue = self.viewModel.messageLastNameError
                    }
                },onChangePhoneText: { (informationText,errorText) in
                    let isValid = self.viewModel.verifyPhoneNumber(phoneNumber: informationText.wrappedValue)
                    self.viewModel.existErrorPhone = !isValid
                    if isValid {
                        errorText.wrappedValue = ""
                        self.viewModel.phone = informationText.wrappedValue
                    } else {
                        errorText.wrappedValue = self.viewModel.messagePhoneError
                    }
                },onChangeEmailText: { (informationText,errorText) in
                    let isValid = self.viewModel.verifyIfEmail(emailText: informationText.wrappedValue)
                    self.viewModel.existErrorEmail = !isValid
                    if isValid {
                        errorText.wrappedValue = ""
                        self.viewModel.email = informationText.wrappedValue
                    } else {
                        errorText.wrappedValue = self.viewModel.messageEmailError
                    }
                }).background(Color.white)
                    .cornerRadius(8).padding()
                Button(action: {
                    if self.viewModel.validateInformation() {
                        self.viewModel.saveContact()
                        back.wrappedValue.dismiss()
                    } else {
                        self.showAlert.toggle()
                    }
                }, label: {
                    Text(self.viewModel.titleButtonAddContact).padding(.all,8.0)
                })
                .background(Color.blue.opacity(0.8).ignoresSafeArea())
                .cornerRadius(8)
                .foregroundColor(Color.white)
                .alert(isPresented: self.$showAlert) {
                    Alert(
                        title: Text(self.viewModel.titleMessageAlert),
                        message: Text(self.viewModel.messageAlert)
                    )
                }
                Spacer()
            }
        }
    }
}
