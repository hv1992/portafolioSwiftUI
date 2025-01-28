//
//  FirebaseFirestoreOptionsViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-23.
//

import Foundation

class FirebaseFirestoreOptionsViewModel : ObservableObject {
    @Published var listOptions : [FirebaseOptionView] = [
        FirebaseOptionView(titleOption: "Agregar información", nameImage: "add_user", firebaseOption: .firestoreAdd),
        FirebaseOptionView(titleOption: "Mostrar información", nameImage: "show_user", firebaseOption: .firestoreShow),
        FirebaseOptionView(titleOption: "Editar información", nameImage: "edit_user", firebaseOption: .firestoreUpdate),
        FirebaseOptionView(titleOption: "Eliminar información", nameImage: "delete_user_data", firebaseOption: .firestoreDelete)
    ]
    
    let titleFirebaseOptions : String = "Firestore Options"
    
    let navigationTitle : String = "Firestore Options"
}
