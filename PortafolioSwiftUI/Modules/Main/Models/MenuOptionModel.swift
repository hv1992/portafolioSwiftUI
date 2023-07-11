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
    var codeOption : MenuOptionCode
    
    init(nameIcon: String? = nil, titleMenuOption: String? = nil,codeOption : MenuOptionCode) {
        self.nameIcon = nameIcon
        self.titleMenuOption = titleMenuOption
        self.codeOption = codeOption
    }
}
