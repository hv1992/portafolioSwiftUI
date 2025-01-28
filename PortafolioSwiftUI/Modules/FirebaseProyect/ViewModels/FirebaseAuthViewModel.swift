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
                
                //Esto sirve para almacenar el correo del usuario en la memoria del telefono. Cuando se realiza el logueo
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
    
    /// Corrobora si esta almacenado el correo del usuario en la memoria del telefono
    /// - Returns: el correo del usuario. En caso de que sea null, no está almacenado el correo en la memoria
    func getIfExistSaveUser() -> String? {
        return UserDefaults.standard.string(forKey: "emailFirebaseAuth")
    }
    
    /// Sirve para que el usuario pueda desloguearse del firebase
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.mensajeAlerta = "Usuario deslogueado con exito"
            self.mostrarAlerta = true
            
            //Aqui se elimina el correo almacenado de la memoria del telefono
            UserDefaults.standard.removeObject(forKey: "emailFirebaseAuth")
        } catch (let error){
            self.mensajeAlerta = error.localizedDescription
            self.mostrarAlerta = true
        }
    }
}
