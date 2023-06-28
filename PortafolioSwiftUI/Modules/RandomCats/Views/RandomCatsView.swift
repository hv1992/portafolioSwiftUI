//
//  RandomCatsView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-28.
//

import SwiftUI

struct RandomCatsView: View {
    @ObservedObject var viewModel : RandomCatsViewModel
    
    init() {
        self.viewModel = RandomCatsViewModel()
    }
    
    var body: some View {
        NavigationView {
            Text("hola")
        }.navigationTitle(self.viewModel.titleNavigationBar)
    }
}

struct RandomCatsView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatsView()
    }
}
