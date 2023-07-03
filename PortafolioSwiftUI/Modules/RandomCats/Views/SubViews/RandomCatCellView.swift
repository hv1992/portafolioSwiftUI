//
//  RandomCatCell.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-02.
//

import SwiftUI

struct RandomCatCellView: View {
    
    @StateObject var viewModel : RandomCatCellViewModel = RandomCatCellViewModel()
    
    var body: some View {
        HStack {
            
        }
    }
}

struct RandomCatCellView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatCellView().previewLayout(.sizeThatFits)
    }
}
