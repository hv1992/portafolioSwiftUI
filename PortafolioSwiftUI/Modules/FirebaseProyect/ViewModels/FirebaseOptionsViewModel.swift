//
//  FirebaseOptionsViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-13.
//

import Foundation
import SwiftUI

class FirebaseOptionsViewModel: ObservableObject {
    @Published var listOptions : [FirebaseOptionView] = []
}
