//
//  OptionView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-22.
//

import SwiftUI

struct OptionMainView: View,Identifiable {
    var viewModel : OptionMainViewModel
    var id : UUID = UUID() //Este es un identificador de la vista para ser usado por un ForEach, o un List
    
    init() {
        self.viewModel = OptionMainViewModel()
    }
    
    var body: some View {
        HStack {
            Image(self.viewModel.nameLogo ?? "")
            Text(self.viewModel.titleOption ?? "").foregroundColor(Color.black)
            Spacer()
        }.padding(.leading,16.0)
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionMainView().previewLayout(.sizeThatFits)
    }
}
