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
    
    @State var opacityValue : CGFloat = 0.0 //Con esto establecemos el nivel de opacidad que va a tener nuestra imagen.
    
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
                .opacity(opacityValue) //Establecemos la opacidad
                .animation(.easeInOut(duration: 0.5), value: opacityValue) //Lo que hace el animación es generar una transición de tiempo de llegar de un valor a otro, cuyo valor final se establece en el .onAppear. El value es el valor en la cual va a sufrir dicha transición
                .shadow(radius: 10) //Esto es para agregar sombra
                .onAppear {
                    opacityValue = 1.0
                }
            textInformation
                .opacity(opacityValue)
                .animation(.easeInOut(duration: 0.5), value: opacityValue)
        }
    }
}

struct RandomCatCellView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatCellView().previewLayout(.sizeThatFits)
    }
}
