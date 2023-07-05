//
//  HeaderOptionMainView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-23.
//

import SwiftUI

struct HeaderMainView: View {
    var viewModel : HeaderMainViewModel = HeaderMainViewModel()
    
    init() {
        self.viewModel = HeaderMainViewModel()
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(self.viewModel.nameAvatar ?? "")
                .resizable()
                .frame(width: 100)
                .cornerRadius(50)
                .shadow(radius: 10)
            Text(self.viewModel.informationAvatar ?? "")
                .bold()
                .multilineTextAlignment(.center)
                .padding(.all)
        }.frame(height: 100)
        
    }
}

struct HeaderOptionMainView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMainView().previewLayout(.sizeThatFits)
    }
}
