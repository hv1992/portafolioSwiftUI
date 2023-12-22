//
//  TitleAddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-22.
//

import SwiftUI

struct TitleAddContactView: View {
    
    @ObservedObject var viewModel : AddContactViewModel
    
    var body: some View {
        Text(self.viewModel.titleScreenAddContact)
            .font(.title)
            .foregroundColor(.white)
    }
}
