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
    
    let urlBaseUrlImageCat : String = "https://cataas.com/cat/"
    let urlBaseGetCats : String = "https://cataas.com/api/cats"
    
    func getCats() {
        let parameters : Parameters = [
            "limit" : 10
        ]
        
        HttpRequest.shared.requestCodable(urlString: self.urlBaseGetCats, parameters: parameters, headers: nil, onSuccess: { (cats : [CatModel]) in 
            self.listCatRandom = cats
        }, onError: nil)
        
    }
}
