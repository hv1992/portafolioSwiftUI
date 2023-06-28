//
//  MenuOptionModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-23.
//

import Foundation

struct MenuOptionModel {
    var nameIcon : String?
    var titleMenuOption : String?
    
    init(nameIcon: String? = nil, titleMenuOption: String? = nil) {
        self.nameIcon = nameIcon
        self.titleMenuOption = titleMenuOption
    }
}
