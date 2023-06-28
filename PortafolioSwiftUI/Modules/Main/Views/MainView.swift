//
//  ContentView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-22.
//

import SwiftUI

struct MainView: View {
    var viewModel : MainViewModel
    var optionsView : [OptionMainView] = []
    var headerView : HeaderMainView
    
    init() {
        self.viewModel = MainViewModel()
        for menu in self.viewModel.listOptionsMenu{
            var optionMain = OptionMainView()
            optionMain.viewModel.nameLogo = menu.nameIcon 
            optionMain.viewModel.titleOption = menu.titleMenuOption
            self.optionsView.append(optionMain)
        }
        
        self.headerView = HeaderMainView()
        self.headerView.viewModel.nameAvatar = self.viewModel.nameAvatarHeader
        self.headerView.viewModel.informationAvatar = self.viewModel.informationHeader
    }
    
    var body: some View {
        VStack {
            self.headerView
            Text(self.viewModel.titleListMenus).font(.largeTitle)
            ForEach(optionsView) { view in
                view
            }
            Spacer() //Esto es para completar el espacio libre
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
