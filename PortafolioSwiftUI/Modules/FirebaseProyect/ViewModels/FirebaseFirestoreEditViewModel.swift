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
    
    func getDataUser() {
        let db = Firestore.firestore()
        
        guard let idUser = Auth.auth().currentUser?.uid else {
            self.messageAlert = "El usuario no está logueado"
            self.showAlert = true
            return
        }
        
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
    
    func editDataUser() {
        let db = Firestore.firestore()
        guard let idUser = Auth.auth().currentUser?.uid else {
            self.messageAlert = "El usuario no está logueado"
            self.showAlert = true
            return
        }
        
        let campos : [String:Any] = ["nombreUsuario":nombreUsuario,"apellidoUsuario":apellidoUsuario,"telefono":telefonoUsuario]
        db.collection("datosUsuarios").document(idUser).updateData(campos){error in
            if let error = error?.localizedDescription {
                self.messageAlert = error
                self.showAlert = true
            }else{
                print("edito solo texto")
            }
        }
    }
    
}
