//
//  NewsClient.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 4/6/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation

struct NewsClient {
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
