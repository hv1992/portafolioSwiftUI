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
    
    init(titleCell: String = "", errorMessage: String = "", playgroundText: String = "", onChangeText: ( (String) -> Void)? = nil, information: String = "") {
        let viewModelTemp = FormCellAddContactViewModel()
        viewModelTemp.titleCell = titleCell
        viewModelTemp.errorMessage = errorMessage
        viewModelTemp.playgroundText = playgroundText
        viewModelTemp.onChangeText = onChangeText
        viewModelTemp.information = information
        self.viewModel = viewModelTemp
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(self.viewModel.titleCell)
                TextField(self.viewModel.playgroundText,text: self.information)
                    .onChange(of: self.viewModel.information) { newInformation in
                        self.viewModel.onChangeText?(newInformation)
                    }
            }.frame(height: 35)
            if !self.viewModel.errorMessage.isEmpty {
                Text(self.self.viewModel.errorMessage)
            }
        }
        
    }
    
}

