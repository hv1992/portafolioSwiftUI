//
//  FirebaseFirestoreDeleteViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-28.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirebaseFirestoreDeleteViewModel : ObservableObject {
    
    let messageDelete : String = "¿Desea eliminar los datos del usuario?"
    let titleButtonDelete : String = "Eliminar"
    let titleAlert : String = "Atención"
    let titleNavigationView : String = "Eliminar información"
    
    @Published var messageAlert : String = ""
    @Published var showAlert : Bool = false
    
    func deleteUser() {
        guard let idUser = Auth.auth().currentUser?.uid else {
            self.messageAlert = "El usuario no está logueado"
            self.showAlert = true
            return
        }
        
        let db = Firestore.firestore()
        db.collection("datosUsuarios").document(idUser).delete()
        
        self.messageAlert = "Datos de usuario eliminados con exito"
        self.showAlert = true
    }
    
}
