//
//  FormCellAddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import Foundation
import SwiftUI

struct FormCellAddContactView : View {
    
    @ObservedObject private var viewModel : FormCellAddContactViewModel
    
    var information : Binding<String> {
        return Binding<String>(get: {self.viewModel.information}, set: {
            self.viewModel.information = $0 })
    }
    
    var errorMessage : Binding<String> {
        return Binding<String>(get: {self.viewModel.errorMessage}, set: {
            self.viewModel.errorMessage = $0 })
    }
    
    init(titleCell: String = "", errorMessage: String = "", playgroundText: String = "", onChangeText: ( (String,Binding<String>) -> Void)?) {
        let viewModelTemp = FormCellAddContactViewModel()
        viewModelTemp.titleCell = titleCell
        viewModelTemp.errorMessage = errorMessage
        viewModelTemp.playgroundText = playgroundText
        viewModelTemp.onChangeText = onChangeText
        self.viewModel = viewModelTemp
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(self.viewModel.titleCell)
                TextField(self.viewModel.playgroundText,text: self.information)
                    .onChange(of: self.viewModel.information) { newInformation in
                        self.viewModel.onChangeText?(newInformation,errorMessage)
                    }
            }.frame(height: 20)
            if !self.viewModel.errorMessage.isEmpty {
                Text(self.viewModel.errorMessage)
                    .font(.footnote)
                    .foregroundColor(.red)
                    .frame(height: 12)
            }
        }
        
    }
    
}

