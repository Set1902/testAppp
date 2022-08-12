//
//  Models.swift
//  TestAppp
//
//  Created by Sergei Kovalev on 03.08.2022.
//

import Foundation

struct Welcome: Codable {
    let data: [Datum]
    let view: [String]
}

struct Datum: Codable {
    let name: String
    let data: DataClass
    
    enum CodingKeys: String, CodingKey {
            case name = "name"
            case data = "data" 

        }
}

struct DataClass: Codable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
    
    enum CodingKeys: String, CodingKey {
            case text = "text"
            case url = "url"
            case selectedId = "selectedId"
            case variants = "variants"

        }
}

struct Variant: Codable {
    let id: Int
    let text: String
    enum CodingKeys: String, CodingKey {
            case id = "id"
            case text = "text"

        }
}
