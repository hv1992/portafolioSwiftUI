//
//  OptionView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-22.
//

import SwiftUI

struct OptionMainView: View {
    var text : String = ""
    var logoName : String = ""
    
    var body: some View {
        HStack(spacing: 10.0) {
            Text(self.text).font(.largeTitle)
            Image(self.logoName)
        }
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionMainView().previewLayout(.sizeThatFits)
    }
}
