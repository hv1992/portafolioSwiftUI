//
//  PortafolioSwiftUIApp.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-22.
//

import SwiftUI

@main
struct PortafolioSwiftUIApp: App {
    
    //Esto es para adaptar una clase de UIKit al SwiftUI, que en este caso es el appDelegate que se usa en los storyboards (UIKit).
    //Esto es un ejemplo como cuando hay ciertas cosas que necesitamos que se hace en el uikit, se haga en este proyecto de swiftUI, que en este caso es el AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    //Esto es para controlar el ciclo de vida de la aplicación, por medio de la scene.
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        print("Es el contructor que se ejecuta primero")
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
            
        //Aqui es donde se controla el ciclo de vida de la app.
        }.onChange(of: scenePhase, perform: { phase in
            switch phase {
            case .active:
                print("Está activo")
                break
            case .inactive:
                print("Está inactivo")
                break
            case .background:
                print("Está en segundo plano")
                break
            default:
                break
            }
        })
    }
}
