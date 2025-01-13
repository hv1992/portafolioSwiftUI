//
//  FirebaseOptionViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-11.
//

import Foundation

class FirebaseOptionViewModel: ObservableObject {
    
    @Published var titleOption : String = ""
    @Published var nameImage : String = ""
    @Published var firebaseOption : FirebaseOptionsEnum = .auth
    
}
