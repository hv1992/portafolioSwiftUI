//
//  FirebaseFirestoreShowViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class FirebaseFirestoreShowViewModel : ObservableObject {
    
    @Published var messageAlert : String = ""
    @Published var showAlert : Bool = false
    @Published var nombreUsuario : String = ""
    @Published var apellidoUsuario : String = ""
    @Published var correoUsuario : String = ""
    @Published var numeroUsuario : String = ""
    
    let titleNavigationView : String = "Mostrar información"
    
    
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
                self.apellidoUsuario = "Apellido: " + (valor?["apellidoUsuario"] as? String ?? "")
                self.correoUsuario = "Correo: " + (valor?["correo"] as? String ?? "")
                self.nombreUsuario = "Nombre:  " + (valor?["nombreUsuario"] as? String ?? "")
                self.numeroUsuario = "Numero: " + (valor?["telefono"] as? String ?? "")
            }
        }
    }
}
