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
    
    @State var opacityValue : CGFloat = 0.0
    
    init(imageCat : Image? = nil,textInformation : Text? = nil) {
        self.imageCat = imageCat
        self.textInformation = textInformation
    }
    
    var body: some View {
        VStack(alignment: .center) {
            imageCat?
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
                .opacity(opacityValue)
                .animation(.linear(duration: 0.5), value: opacityValue)
                .onAppear {
                    opacityValue = 1.0
                }
            textInformation
        }
    }
}

struct RandomCatCellView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatCellView().previewLayout(.sizeThatFits)
    }
}
