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
    
    var titleNavigationBar : String = "Random Dog Image"
    var titlePickerRaceDog : String = "Raza principal de perro:"
    var titlePickerSubRaceDog : String = "Sub raza de perro:"
    var titleProgressLoadRaceDogs : String = "Cargando razas de perro"
    
    var urlRequestListRace : String = "https://dog.ceo/api/breeds/list/all"
    
    func getListRaceDogs() async -> DogRaceModel? {
        do {
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
}
