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
        FirebaseOptionView(titleOption: "Listar información", nameImage: "show_users", firebaseOption: .firestoreShow),
    ]
    
    let titleFirebaseOptions : String = "Firestore Options"
    
    let navigationTitle : String = "Firestore Options"
}
