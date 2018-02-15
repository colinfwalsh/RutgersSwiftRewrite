//
//  Model.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/13/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation


struct OrderedContent: Codable {
    let academicContent: [OrderedContentItem]
    let servicesContent: [OrderedContentItem]
}
struct AcademicsContent: Codable {
    let content: [OrderedContentItem]
}


struct ServicesContent: Codable {
    let content: [OrderedContentItem]
}

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
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? "nan"
        self.title = (try container.decodeIfPresent(Title.self, forKey: .title))
        
    }
    
    
    
}

enum Title: Codable {
    
    
    case string(String)
    case object(MultiTitle)
    
    var text: String {
        switch self {
        case .string(let title):
            return title
        case .object(let multi):
            return multi.homeTitle
        }
    }
    
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
/*
struct Title: Codable {
    let singleTitle: String
    let multiTitle: MultiTitle
    let isSingle: Bool
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        //check for single title
        do {
            singleTitle = try container.decode(String.self)
            isSingle = true
            multiTitle = MultiTitle(homeCampus: "nan", homeTitle: "nan", foreignTitle: "nan")
        } catch { //handle multi title
            multiTitle = try container.decode(MultiTitle.self)
            isSingle = false
            singleTitle = "nan"
        }
    }
    
    
    //dont think we need this
    /*
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try isSingle ? container.encode(singleTitle) : container.encode(multiTitle)
    }
     */
}*/


struct MultiTitle: Codable {
    let homeCampus: String
    let homeTitle: String
    let foreignTitle: String
}
