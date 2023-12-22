//
//  TitleGenericContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-22.
//

import Foundation
import SwiftUI

struct TitleContactListView: View {
    
    @ObservedObject var viewModel : ContactBookViewModel
    
    var body: some View {
        Text(self.viewModel.titleListContacts)
            .font(.title)
            .foregroundColor(.white)
    }
}
