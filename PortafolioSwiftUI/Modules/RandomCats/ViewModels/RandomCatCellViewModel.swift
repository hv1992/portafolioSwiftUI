//
//  RandomCatCellViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-02.
//

import Foundation

class RandomCatCellViewModel : ObservableObject {
    @Published var urlString : String?
    @Published var owner : String?
}
