//
//  RandomCatsViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-28.
//

import Foundation
import Alamofire

class RandomCatsViewModel : ObservableObject {
    
    @MainActor @Published var listCatRandom : [CatModel] = []
    @MainActor @Published var errorMessageListCats = ""
    
    let titleNavigationBar : String = "Random Cats Image"
    
    let urlBaseUrlImageCat : String = "https://cataas.com/cat/"
    let urlBaseGetCats : String = "https://cataas.com/api/cats"
    
    let countCatImages : Int = 10
    
    private func getCats() async -> [CatModel]? {
        let parameters : Parameters = [
            "limit" : self.countCatImages
        ]
        
        do {
            let catList : [CatModel] = try await HttpRequest.shared.requestCodable(urlString: self.urlBaseGetCats, parameters: parameters, headers: nil)
            return catList
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    
    
    func loadListCats() async {
        await MainActor.run {
            self.errorMessageListCats = ""
        }
        
        if let listCats = await self.getCats() {
            await MainActor.run {
                self.listCatRandom = listCats
            }
        } else {
            await MainActor.run {
                self.errorMessageListCats = "Error fetch data"
            }
        }
    }
    
    func getUrlCatImage(idImageCat : String) -> String{
        return self.urlBaseUrlImageCat + idImageCat
    }
    
}
