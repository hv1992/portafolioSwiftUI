//
//  TypeHttpConstant.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-01.
//

import Foundation

enum TypeHttpEnum {
    case get
    case post
    case put
    case delete
    
    var value : String {
        switch self {
            case .get: return "GET"
            case .post: return "POST"
            case .put: return "PUT"
            case .delete: return "DELETE"
        }
    }
    
}
