//
//  FirebaseFirestoreEditViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-27.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirebaseFirestoreEditViewModel : ObservableObject {
    let titleNameUser : String = "Nombre"
    let titleLastnameUser : String = "Apellido"
    let titleEmailUser : String = "Correo"
    let titlePhoneUser : String = "Teléfono"
    let titleButtonEditUser : String = "Editar"
    let titleNavigationView : String = "Editar información"
    let titleAlert : String = "Atención"
    
    @Published var messageAlert : String = ""
    @Published var showAlert : Bool = false
    
    @Published var nombreUsuario : String = ""
    @Published var apellidoUsuario : String = ""
    @Published var telefonoUsuario : String = ""
    
    /// Obtenemos los datos del usuario almacenados en la firestore, para ser editados
    func getDataUser() {
        let db = Firestore.firestore()
        
        guard let idUser = Auth.auth().currentUser?.uid else {
            self.messageAlert = "El usuario no está logueado"
            self.showAlert = true
            return
        }
        
        //Se realiza la llamada obtener los datos
        db.collection("datosUsuarios").document(idUser).addSnapshotListener { (QuerySnapshot, error) in
            if let error = error?.localizedDescription{
                self.messageAlert = error
                self.showAlert = true
                print("error al mostrar datos ", error)
            }else if let QuerySnapshotTemp = QuerySnapshot {
                let valor = QuerySnapshotTemp.data()
                self.apellidoUsuario = valor?["apellidoUsuario"] as? String ?? ""
                self.nombreUsuario = valor?["nombreUsuario"] as? String ?? ""
                self.telefonoUsuario = valor?["telefono"] as? String ?? ""
            }
        }
    }
    
    /// Realiza la subida de la modificación de los datos del usuario
    func editDataUser() {
        let db = Firestore.firestore()
        
        //Corrobora si el usuario está logueado. En caso de que no esté, se muestra mensaje de alerta, y detiene el proceso
        guard let idUser = Auth.auth().currentUser?.uid else {
            self.messageAlert = "El usuario no está logueado"
            self.showAlert = true
            return
        }
        
        //Estos son los campos que se van a enviar para modificar
        let campos : [String:Any] = ["nombreUsuario":nombreUsuario,"apellidoUsuario":apellidoUsuario,"telefono":telefonoUsuario]
        
        //Se hace la llamada para realizar la modificación de los datos
        db.collection("datosUsuarios").document(idUser).updateData(campos){error in
            if let error = error?.localizedDescription {
                self.messageAlert = error
                self.showAlert = true
            }else{
                self.messageAlert = "Edición con éxito"
                self.showAlert = true
            }
        }
    }
    
}
