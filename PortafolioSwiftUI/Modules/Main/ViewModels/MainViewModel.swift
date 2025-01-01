//
//  MainViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-23.
//

import Foundation

class MainViewModel {
    let listOptionsMenu : [MenuOptionModel] = [
        MenuOptionModel(nameIcon: "catIcon",titleMenuOption: "Cat Randoms Image",codeOption: .catImage),
        MenuOptionModel(nameIcon: "dogIcon",titleMenuOption: "Random Dog Image",codeOption: .dogImage),
        MenuOptionModel(nameIcon: "contactIcon",titleMenuOption: "Contacts List",codeOption: .contactList),
        MenuOptionModel(nameIcon: "listaGrip",titleMenuOption: "Lista Grip",codeOption: .listaGrip)
    ]
    
    let nameAvatarHeader : String = "LogoApp"
    let informationHeader : String = "Portafolio SwiftUI"
    
    let titleListMenus : String = "Menu"
    
    let titleBottonDown : String = "Acerca de"
    
}
