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
    
    init(onChangeNameText: ( (Binding<String>, Binding<String>) -> Void)? = nil, onChangeLastNameText: ( (Binding<String>, Binding<String>) -> Void)? = nil, onChangePhoneText: ( (Binding<String>, Binding<String>) -> Void)? = nil, onChangeEmailText: ( (Binding<String>, Binding<String>) -> Void)? = nil) {
        self.viewModel = FormAddContactViewModel()
        self.onChangeNameText = onChangeNameText
        self.onChangeLastNameText = onChangeLastNameText
        self.onChangePhoneText = onChangePhoneText
        self.onChangeEmailText = onChangeEmailText
    }
    
    var body: some View {
        VStack {
            FormCellAddContactView(titleCell: self.viewModel.titleName,onChangeText: onChangeNameText)
            FormCellAddContactView(titleCell: self.viewModel.titleLastName,onChangeText: onChangeLastNameText)
            FormCellAddContactView(titleCell: self.viewModel.titlePhone, onChangeText: onChangePhoneText)
            FormCellAddContactView(titleCell: self.viewModel.titleEmail, onChangeText: onChangeEmailText)
        }.padding()
    }
}

#Preview {
    FormAddContactView()
}
