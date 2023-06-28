//
//  CatModel.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-28.
//

import Foundation

struct CatModel: Codable,Identifiable {
    let id: String?
    let tags: [String]?
    let owner, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case tags, owner, createdAt, updatedAt
    }
}
