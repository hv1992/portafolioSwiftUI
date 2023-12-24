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
            FormCellAddContactView(titleCell: self.viewModel.titleName,onChangeText: { (nameText,errorMessageBinding) in
                print(nameText)
                errorMessageBinding.wrappedValue = nameText
            })
            FormCellAddContactView(titleCell: self.viewModel.titleLastName,onChangeText: { (lastNameText,errorMessageBinding) in
                
            })
            FormCellAddContactView(titleCell: self.viewModel.titlePhone, onChangeText: { (titlePhoneText,errorMessageBinding) in
                
            })
            FormCellAddContactView(titleCell: self.viewModel.titleEmail, onChangeText: { (emailText,errorMessageBinding) in
                
            })
        }.padding()
    }
}

#Preview {
    FormAddContactView()
}
