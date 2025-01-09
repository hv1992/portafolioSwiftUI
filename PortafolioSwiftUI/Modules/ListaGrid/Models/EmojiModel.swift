//
//  EmojiModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-01.
//

import Foundation

class EmojiModel : Codable, Identifiable {
    var id : UUID = UUID()
    var character : String?
    
    enum CodingKeys : String, CodingKey {
        case character = "character"
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(self.character, forKey: .character)
    }
    
}

