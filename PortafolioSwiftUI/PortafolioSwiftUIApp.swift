//
//  PortafolioSwiftUIApp.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-22.
//

import SwiftUI

@main
struct PortafolioSwiftUIApp: App {
    
    let contactBookPersistence : ContactBookPersistenceController = ContactBookPersistenceController.shared
    
    //Esto es para adaptar una clase de UIKit al SwiftUI, que en este caso es el appDelegate que se usa en los storyboards (UIKit).
    //Esto es un ejemplo como cuando hay ciertas cosas que necesitamos que se hace en el uikit, se haga en este proyecto de swiftUI, que en este caso es el AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    //Esto es para controlar el ciclo de vida de la aplicación, por medio de la scene.
    @Environment(\.scenePhase) var scenePhase
    
    var globalVariable = GlobalModel() //Esto seria como una variable global que se va a usar en todo el aplicativo
    
    init() {
        print("Es el contructor que se ejecuta primero")
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                //Esto es para que puedas administrar la gestión de guardado del libro de contactos en el core data.
                .environment(\.managedObjectContext,contactBookPersistence.container.viewContext)
                .environmentObject(globalVariable) //Aqui estamos estableciendo la variable global que se va a usar en todo el proyecto. La ventaja del environment es que, cuando se modifica los valores de la clase, se modifica tambien en todo las vista a la vez.
            
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
