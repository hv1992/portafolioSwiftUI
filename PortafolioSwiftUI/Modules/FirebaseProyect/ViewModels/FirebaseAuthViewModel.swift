//
//  FirebaseAuthViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-15.
//

import Foundation
import FirebaseAuth

/*
 Usuarios para probar:
 - email: perro@cana.com , contraseña: perrocana
 */

class FirebaseAuthViewModel : ObservableObject {
    let titleFirstCamp : String = "Email"
    let titleSecondCamp : String = "Contraseña"
    let titleFirstButton : String = "Iniciar Sesión"
    let titleSecondButton : String = "Cerrar Sesión"
    let titleNavigationBar : String = "Firebase Auth"
    
    @Published var mensajeAlerta : String = ""
    @Published var mostrarAlerta : Bool = false
    
    func signInt(email: String, password : String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                UserDefaults.standard.set(user?.user.email, forKey: "emailFirebaseAuth")
                self.mensajeAlerta = "Sesión iniciada con éxito"
                self.mostrarAlerta = true
            }else{
                if let error = error?.localizedDescription {
                    self.mensajeAlerta = error
                }else{
                    self.mensajeAlerta = "Error desconocido"
                }
                self.mostrarAlerta = true
            }
        }
    }
    
    func getIfExistSaveUser() -> String? {
        return UserDefaults.standard.string(forKey: "emailFirebaseAuth")
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.mensajeAlerta = "Usuario deslogueado con exito"
            self.mostrarAlerta = true
            UserDefaults.standard.removeObject(forKey: "emailFirebaseAuth")
        } catch (let error){
            self.mensajeAlerta = error.localizedDescription
            self.mostrarAlerta = true
        }
    }
}
