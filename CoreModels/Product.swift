//
//  ProductData.swift
//  CoreModels
//
//  Created by navpreet on 13-12-2025.
//

import Foundation

public struct Product: Codable, Identifiable, Hashable {
    public static func == (lhs: Product, rhs: Product) -> Bool {
        true
    }
    
    
    public let id: String
    public let name: String
    public let data: ProductData
}


