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
            FormCellAddContactView(titleCell: self.viewModel.titleName, information: self.viewModel.nameContact)
            FormCellAddContactView(titleCell: self.viewModel.titleLastName, information: self.viewModel.lastName)
            FormCellAddContactView(titleCell: self.viewModel.titlePhone, information: self.viewModel.phone)
            FormCellAddContactView(titleCell: self.viewModel.titleEmail, onChangeText: { emailText in
                
            }, information: self.viewModel.email)
        }.padding()
    }
}

#Preview {
    FormAddContactView()
}
