//
//  FirebaseProyectOptionsViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-13.
//

import Foundation

class FirebaseProyectOptionsViewModel: ObservableObject {
    @Published var listOptions : [FirebaseOptionView] = [
        FirebaseOptionView(titleOption: "Authentication", nameImage: "authenticator", firebaseOption: .auth),
        FirebaseOptionView(titleOption: "Storage", nameImage: "storage", firebaseOption: .storage),
        FirebaseOptionView(titleOption: "Database", nameImage: "database", firebaseOption: .firestore),
    ]
}
