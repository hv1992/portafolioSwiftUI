//
//  FirebaseFirestoreAddInformationViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-20.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirebaseFirestoreAddInformationViewModel: ObservableObject {
    let titleNameUser : String = "Nombre"
    let titleLastnameUser : String = "Apellido"
    let titleEmailUser : String = "Correo"
    let titlePhoneUser : String = "Teléfono"
    let titleButtonSaveUser : String = "Guardar"
    let titleNavigationView : String = "Agregar información"
    
    @Published var messageAlert : String = ""
    @Published var showAlert : Bool = false
    
    func guardarDatos(nombreUsuario : String, apellidoUsuario : String, telefonoUsuario : String) {
        
        // GUARDAR TEXTO
        let db = Firestore.firestore()
        let id = UUID().uuidString
        guard let idUser = Auth.auth().currentUser?.uid else {
            self.messageAlert = "El usuario no está logueado"
            self.showAlert = true
            return
        }
        guard let email = Auth.auth().currentUser?.email else {
            self.messageAlert = "El usuario no está logueado"
            self.showAlert = true
            return
        }
        let campos : [String:Any] = ["idUser":idUser,"nombreUsuario":nombreUsuario,"apellidoUsuario":apellidoUsuario,"correo":email,"telefono":telefonoUsuario]
        db.collection("datosUsuarios").document(id).setData(campos){error in
            if let error = error?.localizedDescription{
                self.messageAlert = error
                self.showAlert = true
                print("error al guardar en firestore", error)
            }else{
                self.messageAlert = "Datos guardados con éxito"
                self.showAlert = true
                print("guardo todo")
            }
        }
    }
    
}
