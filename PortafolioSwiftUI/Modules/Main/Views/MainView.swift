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
    
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    init() {
        
        //En el init es donde se instancia todos los objetos, y se prepara dichos objectos para que sea usado en la vista.
        
        //Se prepara el listado de menus
        self.viewModel = MainViewModel()
        for menu in self.viewModel.listOptionsMenu{
            var optionMain = OptionMainView()
            optionMain.viewModel.nameLogo = menu.nameIcon 
            optionMain.viewModel.titleOption = menu.titleMenuOption
            self.optionsView.append(optionMain)
        }
        
        //Se prepara el header
        self.headerView = HeaderMainView()
        self.headerView.viewModel.nameAvatar = self.viewModel.nameAvatarHeader
        self.headerView.viewModel.informationAvatar = self.viewModel.informationHeader
    }
    
    var body: some View {
        VStack {
            self.headerView
            Text(self.viewModel.titleListMenus).font(.largeTitle).bold()
            ForEach(optionsView) { view in
                Button(action: {
                    print("Abriendo un menu")
                }) {
                    view
                }
            }
            Spacer() //Esto es para completar el espacio libre
        }.background(LinearGradient(colors: [.blue,self.skyBlue], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all)) //Tengo que poner el ignoreSafeArea dentro del LinearGradient para que cubra todo el fondo sin que los elementos se vayan al safe area.
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
