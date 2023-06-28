//
//  RandomCatsViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-28.
//

import Foundation
import Alamofire

class RandomCatsViewModel : ObservableObject {
    
    @Published var listCatRandom : [CatModel] = []
    
    let titleNavigationBar : String = "Random Cats Image"
    
}
