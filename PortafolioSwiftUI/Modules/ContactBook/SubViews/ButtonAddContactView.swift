//
//  AddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-22.
//

import Foundation
import SwiftUI

struct ButtonAddContactView : View {
    let viewModel : ButtonAddContactViewModel = ButtonAddContactViewModel()
    
    @State var showScreenAddContact : Bool = false
    
    var body: some View {
        Button {
            self.showScreenAddContact.toggle()
        } label: {
            Text(self.viewModel.titleButtonAddContact).padding(.all,8.0)
        }
        .background(Color.blue.opacity(0.8).ignoresSafeArea())
        .cornerRadius(8)
        .foregroundColor(Color.white)
        .sheet(isPresented: $showScreenAddContact) {
            AddContactView()
        }
    }
    
}
