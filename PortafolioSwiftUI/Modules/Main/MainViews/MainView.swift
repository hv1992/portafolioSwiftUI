//
//  ContentView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-22.
//

import SwiftUI

struct MainView: View {
    
    //Binding: es la conexion entre una propiedad que almacena datos (variable) y una vista que cambia el valor (Textfield).
    //Para usar el Binding, se usa el signo de $ delante de la variable.
    
    // el @State es para que puedas modificar variables en una función. Si no tiene el @State, es de solo lectura.
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
    
    //MARK : Hacer despues el acerca de con .sheet (modal)
    var body: some View {
        NavigationView {
            VStack {
                self.headerView
                Text(self.viewModel.titleListMenus).font(.largeTitle).bold()
                ForEach(optionsView) { view in
                    //El NavigationLink es el que hace que nosotros podamos pasar a la siguiente pantalla.
                    NavigationLink(destination: RandomCatsView()) {
                        view
                    }
                }
                Spacer() //Esto es para completar el espacio libre
            }.background(LinearGradient(colors: [.blue,self.skyBlue], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all)) //Tengo que poner el ignoreSafeArea dentro del LinearGradient para que cubra todo el fondo sin que los elementos se vayan al safe area.
                .onAppear {
                    print("cargo la vista VStack")
                }
                .onDisappear {
                    print("desaparece la vista VStack")
                }
            
        //Esto es para controlar el ciclo de vida de cada view, que en este caso el view es el NavigationView (Cada vista tiene su ciclo de vida propio).
        }.onAppear {
            print("cargo la vista NavigationView")
        }
        .onDisappear {
            print("desaparece la vista NavigationView")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
