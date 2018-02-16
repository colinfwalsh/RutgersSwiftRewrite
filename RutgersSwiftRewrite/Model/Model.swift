//
//  Model.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/13/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation

/*
  Instead of having one object to map all the items to, instead map the items to a dictionary
  So if we wanted all the items in Academics, the call would look like: orderedContent["academicContent"].
  This would be lighter and easier to use across the application.
*/
struct OrderedContent: Codable {
    let academicContent: [OrderedContentItem]
    let servicesContent: [OrderedContentItem]
}
// Are these necessary?
struct AcademicsContent: Codable {
    let content: [OrderedContentItem]
}

struct ServicesContent: Codable {
    let content: [OrderedContentItem]
}

/*
 Also, the model might look cleaner if we define the struct with their property values,
 but then extend off of them in order to implement constructors or other functions. 
*/
struct OrderedContentItem: Codable {
    //Adjust these according to whether or not they are optional values or not.
    let handle: String
    let title: Title?
    let icon: String
    let grouped: Bool
    let view: String
    let api: String
    let url: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        /*
        Setting these to "nan" isn't that helpful here.  Essentially you're just circumventing the implementation of optionals
        since we'd still have to do checks for "nan" which doesn't make our lives easier.  Make sure if the value can be null 
        to make it optional and use optionals when in doubt since the swift language has extensive checks for optionals and 
        optional handling.
      
        However, if you're absolutely certain that a value will be returned for a given field, then it's fine to implicitly unwrap
        the optional.  Especially in the early stages of the app we can do this since we can see exactly where an application crashes if 
        we get an unexpected value.  Furthermore, we have error handling for when the network is down, or when a map fails
        so we should be ok with '!' for some of these. 
        */
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


