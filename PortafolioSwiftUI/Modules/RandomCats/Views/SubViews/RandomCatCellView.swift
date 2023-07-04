//
//  RandomCatCell.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-02.
//

import SwiftUI

struct RandomCatCellView: View,Identifiable {
    var id = UUID()
    
    var imageCat : Image?
    var textInformation : Text?
    
    init(imageCat : Image? = nil,textInformation : Text? = nil) {
        self.imageCat = imageCat
        self.textInformation = textInformation
    }
    
    var body: some View {
        VStack(alignment: .center) {
            imageCat?.resizable().scaledToFit()
            textInformation
        }
    }
}

struct RandomCatCellView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatCellView().previewLayout(.sizeThatFits)
    }
}
