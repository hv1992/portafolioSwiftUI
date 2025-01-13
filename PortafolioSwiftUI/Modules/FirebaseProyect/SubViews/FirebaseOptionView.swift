//
//  FirebaseOptionView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-11.
//

import Foundation
import SwiftUI

struct FirebaseOptionView: View,Identifiable{
    let id: UUID = UUID()
    
    @ObservedObject var viewModel : FirebaseOptionViewModel
    
    init(titleOption: String,nameImage: String,firebaseOption: FirebaseOptionsEnum) {
        self.viewModel = FirebaseOptionViewModel()
        self.viewModel.titleOption = titleOption
        self.viewModel.nameImage = nameImage
        self.viewModel.firebaseOption = firebaseOption
    }
    
    var body: some View {
        HStack {
            Image(self.viewModel.nameImage).resizable().frame(width: 50,height: 50)
            Text(self.viewModel.titleOption)
            Spacer()
        }.padding(.leading,16.0)
            .padding(.trailing,8.0)
    }
}

#Preview { FirebaseOptionView(titleOption: "Prueba", nameImage: "dogIcon",firebaseOption: .auth) }

