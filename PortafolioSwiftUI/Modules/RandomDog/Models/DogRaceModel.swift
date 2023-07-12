//
//  DogRaceModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-11.
//

import Foundation

class DogRaceModel : Codable,Identifiable {
    var id = UUID()
    let message : [String:[String]]?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case message
        case status
    }
        
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try? container.decode([String:[String]].self, forKey: .message)
        status = try? container.decode(String.self, forKey: .status)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(message, forKey: .message)
        try? container.encode(status, forKey: .status)
    }
}
