//
//  TitleAddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-22.
//

import SwiftUI

struct TitleAddContactView: View {
    
    private var viewModel : TitleAddContactViewModel = TitleAddContactViewModel()
    
    var body: some View {
        Text(self.viewModel.titleScreenAddContact)
            .font(.title)
            .foregroundColor(.white)
    }
}
