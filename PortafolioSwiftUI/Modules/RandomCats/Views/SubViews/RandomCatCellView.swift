//
//  RandomCatCell.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-02.
//

import SwiftUI

struct RandomCatCellView: View,Identifiable {
    var id = UUID()
    
    @State var imageCat : Image?
    @State var textOwner : Text?
    
    var body: some View {
        HStack {
            if imageCat != nil {
                imageCat
            }
            if textOwner != nil {
                textOwner
            }
        }
    }
}

struct RandomCatCellView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatCellView().previewLayout(.sizeThatFits)
    }
}
