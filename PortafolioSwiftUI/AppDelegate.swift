//
//  AppDelegate.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-02.
//

import UIKit
import FirebaseCore

class AppDelegate : NSObject,UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("didFinishLaunchingWithOptions: AppDelegate")
        
        //Configurar el Firebase
        FirebaseApp.configure()
        return true
    }
}
