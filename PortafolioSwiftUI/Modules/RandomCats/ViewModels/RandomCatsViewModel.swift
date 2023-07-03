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
    
    func getCats() {
        let parameters : Parameters = [
            "limit" : 10
        ]
        
        AF.request("https://cataas.com/api/cats",parameters: parameters).responseDecodable(of:[CatModel].self) { response in
            switch(response.result) {
                case .success(let cats):
                    self.listCatRandom = cats
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    break
            }
        }
    }
}
