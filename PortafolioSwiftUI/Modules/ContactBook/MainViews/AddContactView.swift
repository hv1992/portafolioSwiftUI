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
                    
                },onChangeLastNameText: { (informationText,errorText) in
                    
                },onChangePhoneText: { (informationText,errorText) in
                    
                },onChangeEmailText: { (informationText,errorText) in
                    if self.viewModel.verifyIfEmail(emailText: informationText.wrappedValue) {
                        errorText.wrappedValue = ""
                        self.viewModel.existErrorEmail = false
                        self.viewModel.email = informationText.wrappedValue
                    } else {
                        self.viewModel.existErrorEmail = true
                        errorText.wrappedValue = self.viewModel.messageEmailError
                    }
                }).background(Color.white)
                    .cornerRadius(8).padding()
                DefaultButtonBlue(titleButton: self.viewModel.titleButtonAddContact,actionButton: {
                    back.wrappedValue.dismiss()
                })
                Spacer()
            }
        }
    }
}
