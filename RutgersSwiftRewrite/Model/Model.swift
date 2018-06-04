//
//  Model.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/13/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation

struct OrderedContent: Codable {
    let modules: [OrderedContentItem]?
    let links: [OrderedContentItem]?
}

struct OrderedContentItem: Codable {
    let handle: String?
    let title: Title?
    let icon: String?
    let grouped: Bool?
    let view: String?
    let api: String?
    let url: String?
}

extension OrderedContentItem {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.handle = try container.decodeIfPresent(String.self, forKey: .handle)
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon)
        self.grouped = try container.decodeIfPresent(Bool.self, forKey: .grouped)
        self.view = try container.decodeIfPresent(String.self, forKey: .view)
        self.api = try container.decodeIfPresent(String.self, forKey: .api)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.title = try container.decodeIfPresent(Title.self, forKey: .title)
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

struct MultiTitle: Codable {
    let homeCampus: String
    let homeTitle: String
    let foreignTitle: String
}
