//
//  RandomDogViewModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-07.
//

import Foundation

class RandomDogViewModel : ObservableObject {
    @MainActor @Published var dogRaceList : [String:[String]] = [:]
    @MainActor @Published var errorMessageGetRaces : String = ""
    @Published var listMainRaceDog : [String] = []
    @Published var listSubRaceDog : [String] = []
    
    let titleNavigationBar : String = "Random Dog Image"
    let titlePickerRaceDog : String = "Raza principal de perro:"
    let titlePickerSubRaceDog : String = "Sub raza de perro:"
    let titleProgressLoadRaceDogs : String = "Cargando razas de perro"
    let titleButtonLoadImageDog : String = "Obtener imagen"
    let titleProgressViewLoadDog : String = "Cargando perrito"
    
    let urlRequestListRace : String = "https://dog.ceo/api/breeds/list/all"
    
    func getListRaceDogs() async -> DogRaceModel? {
        do {
            //El await sirve para hacer la llamada asincrona del metodo requestCodable. Esto se conoce como "Cross-actor reference"
            let raceDogList : DogRaceModel = try await HttpRequest.shared.requestCodable(urlString: urlRequestListRace,parameters: nil,headers: nil)
            return raceDogList
        } catch (let error) {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func loadDogRaces () async {
        await MainActor.run {
            self.errorMessageGetRaces = ""
        }
        
        if let listDog = await self.getListRaceDogs() {
            await MainActor.run { //Esto es para ejecutar en el hilo principal, o "actuación principal"
                self.dogRaceList = listDog.message ?? [:]
            }
        } else {
            await MainActor.run {
                self.errorMessageGetRaces = "Error fetch data"
            }
        }
    }
    
    func getListMainRaceDogs() async -> [String]{
        var result : [String] = []
        for race in await self.dogRaceList {
            result.append(race.key)
        }
        result.sort()
        return result
    }
    
    func getSubListRaceDogs(mainRace : String) async -> [String] {
        var result = await self.dogRaceList[mainRace] ?? []
        result.sort()
        return result
    }
    
    func getUrlImageDog(raceDog : String,subRaceDog : String) async -> String?{
        do {
            var partForGetImageDog : String = ""
            if !raceDog.isEmpty && !subRaceDog.isEmpty {
                partForGetImageDog = "\(raceDog)/\(subRaceDog)"
            } else if !raceDog.isEmpty {
                partForGetImageDog = raceDog
            }
            let urlRequestUrlImageDog = "https://dog.ceo/api/breed/\(partForGetImageDog)/images/random"
            let dogImageModel : DogImageModel = try await HttpRequest.shared.requestCodable(urlString: urlRequestUrlImageDog, parameters: nil, headers: nil)
            return dogImageModel.message
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
