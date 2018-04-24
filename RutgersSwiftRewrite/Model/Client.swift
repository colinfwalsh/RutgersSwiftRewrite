//
//  Client.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/13/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation

struct Client {
    enum OrderedContentKeys {
        case academics
        case services
    }

    static func getOrderedContent(completion: (OrderedContent) -> Void) {
        if let path = Bundle.main.path(forResource: "ordered_content", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let content = try JSONDecoder().decode(OrderedContent.self, from: data)
                completion(content)
            } catch {
                print("error getting local file")
            }
        }
    }
    static func getNewsFeeds(completion: @escaping ([NewsSource]) -> Void) {
        if let path = Bundle.main.path(forResource: "news", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let content = try JSONDecoder().decode([NewsSource].self, from: data)
                completion(content)
            } catch {
                print("error getting news")
            }
        }
    }
}
