//
//  ThemeNavigationBar.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-05.
//

import Foundation
import UIKit

class ThemeNavigationBar {
    static func navigationBarColors(background : UIColor? = nil,
                                    titleColor : UIColor? = nil, tintColor : UIColor? = nil,backButtonColor : UIColor? = nil ){
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        
        //Configura el color de fondo de la barra
        navigationAppearance.backgroundColor = background ?? .clear
        
        
        //Configura el titulo de la barra de navegación
        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]
        
        //Configura el botón de volver
        let backItemAppearance = UIBarButtonItemAppearance()
        backItemAppearance.normal.titleTextAttributes = [.foregroundColor : backButtonColor ?? .white]
        let image = UIImage(systemName: "chevron.backward")?.withTintColor(backButtonColor ?? .white, renderingMode: .alwaysOriginal) // fix indicator color
        navigationAppearance.setBackIndicatorImage(image, transitionMaskImage: image)
        navigationAppearance.backButtonAppearance = backItemAppearance
        
        //Se elimina el separador de la barra inferior de la barra de navegación
        navigationAppearance.shadowColor = .clear
       
        //Configura para todas las áreas
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
    }
}
