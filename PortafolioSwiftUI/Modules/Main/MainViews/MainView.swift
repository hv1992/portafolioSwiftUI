//
//  ContentView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        //Como esta vista es donde comienza todo, no es necesario agregar en otras partes
        if #available(iOS 16.0, *) {
            NavigationView {
                MainContainerView()
                    //Aqui nosotros ocultamos el navigationBar. Cabe destacar de que tiene que agregarse en la vista que es contenida por el navigationView
                    .toolbar(.hidden)
                //Esto es para controlar el ciclo de vida de cada view, que en este caso el view es el NavigationView (Cada vista tiene su ciclo de vida propio).
            }.onAppear {
                print("cargo la vista NavigationView")
            }
            .onDisappear {
                print("desaparece la vista NavigationView")
            }
        } else {
            NavigationView {
                MainContainerView()
                //Aqui nosotros ocultamos el navigationBar. Cabe destacar de que tiene que agregarse en la vista que es contenida por el navigationView
                    .navigationBarHidden(true)
                //Esto es para controlar el ciclo de vida de cada view, que en este caso el view es el NavigationView (Cada vista tiene su ciclo de vida propio).
            }.onAppear {
                print("cargo la vista NavigationView")
            }
            .onDisappear {
                print("desaparece la vista NavigationView")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct MainContainerView: View {
    //Binding: es la conexion entre una propiedad que almacena datos (variable) y una vista que cambia el valor (Textfield).
    //Para usar el Binding, se usa el signo de $ delante de la variable.
    
    // el @State es para que puedas modificar variables en una función. Si no tiene el @State, es de solo lectura.
    var viewModel : MainViewModel
    var optionsView : [OptionMainView] = []
    var headerView : HeaderMainView
    @State var mostrarSubPantalla : Bool = false
    
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    init() {
        
        //En el init es donde se instancia todos los objetos, y se prepara dichos objectos para que sea usado en la vista.
        
        //Se prepara el listado de menus
        self.viewModel = MainViewModel()
        for menu in self.viewModel.listOptionsMenu{
            var optionMain = OptionMainView()
            optionMain.viewModel.nameLogo = menu.nameIcon
            optionMain.viewModel.titleOption = menu.titleMenuOption
            optionMain.viewModel.codeOption = menu.codeOption
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
            Text(self.viewModel.titleListMenus).font(.largeTitle).bold().underline().foregroundColor(Color.white)
            ForEach(optionsView) { view in
                //El NavigationLink es el que hace que nosotros podamos pasar a la siguiente pantalla.
                if view.viewModel.codeOption == .catImage {
                    NavigationLink(destination: RandomCatsView()) {
                        view
                    }
                } else if view.viewModel.codeOption == .dogImage {
                    NavigationLink(destination: RandomDogView()) {
                        view
                    }
                } else if view.viewModel.codeOption == .contactList {
                    NavigationLink(destination: ContactBookView()) {
                        view
                    }
                } else if view.viewModel.codeOption == .listaGrip {
                    NavigationLink(destination: ListaGridView()) {
                        view
                    }
                }
            }
            Spacer() //Esto es para completar el espacio libre
            Button(self.viewModel.titleBottonDown, action: {
                self.mostrarSubPantalla.toggle() //toogle lo que hace es conmutar de true a false, y viceversa
            })
            .foregroundColor(Color.white)
            .sheet(isPresented: $mostrarSubPantalla) {
                VStack {
                    InformationAppView()
                }
            }
            .padding(.bottom)
        }.background(LinearGradient(colors: [.blue,self.skyBlue], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all)) //Tengo que poner el ignoreSafeArea dentro del LinearGradient para que cubra todo el fondo sin que los elementos se vayan al safe area.
            .onAppear {
                print("cargo la vista VStack")
            }
            .onDisappear {
                print("desaparece la vista VStack")
            }
    }
}
