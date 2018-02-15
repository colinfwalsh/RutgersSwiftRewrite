//
//  Model.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/13/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation

struct OrderedContentItem: Codable {
    let handle: String
    let title: Title?
    let icon: String
    let grouped: Bool
    let view: String
    let api: String
    let url: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.handle = try container.decodeIfPresent(String.self, forKey: .handle) ?? "nan"
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon) ?? "nan"
        self.grouped = try container.decodeIfPresent(Bool.self, forKey: .grouped) ?? false
        self.view = try container.decodeIfPresent(String.self, forKey: .view) ?? "nan"
        self.api = try container.decodeIfPresent(String.self, forKey: .api) ?? "nan"
        self.url = try container.decodeIfPresent(String.self, forKey: .handle) ?? "nan"
        self.title = try container.decodeIfPresent(Title.self, forKey: .title)
        
    }
}

enum Title: Codable {
    
    case string(String)
    case object(MultiTitle)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
           self = try .string(container.decode(String.self))
        } catch DecodingError.typeMismatch {
           self = try .object(container.decode(MultiTitle.self))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

struct MultiTitle: Codable {
    let homeCampus: String
    let homeTitle: String
    let foreignTitle: String
}


