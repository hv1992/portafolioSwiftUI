//
//  InformationAppView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-05.
//

import SwiftUI

struct InformationAppView: View {
    
    //El @Envoronment sirve para obtener un valor de esta vista, que en este caso, el valor a obtener el modo de presentación
    @Environment(\.presentationMode) var back
    
    var viewModel : InformationAppViewModel = InformationAppViewModel()
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.8).ignoresSafeArea() //Esto es para que cubra toda el area sin importar el "safe area"
            VStack(spacing: 16){
                HStack {
                    Spacer()
                    Button(action : {
                        back.wrappedValue.dismiss()
                    }) {
                        Label(self.viewModel.titleButtonClose, systemImage: "xmark.circle.fill").foregroundColor(.white)
                    }
                }
                Image(self.viewModel.lindkedinNameImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle()) //El clipShape estable una forma de recorte
                    .shadow(radius: 10)
                    .frame(height: 200)
                Text(self.viewModel.completeNameCreatorApp)
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center) //El multilineTextAlignment es para establecer la alineación del texto
                Text(self.viewModel.informationAboutApp)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Link(self.viewModel.titleLinkGoToLinkedIn, destination: URL(string: self.viewModel.urlLinkedin)!)
                    .foregroundColor(.white)
                    .font(.title3)
                Spacer()
            }
            .padding(.all)
        }
    }
}

struct InformationAppView_Previews: PreviewProvider {
    static var previews: some View {
        InformationAppView()
    }
}
