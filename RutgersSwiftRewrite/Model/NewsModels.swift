//
//  NewsModels.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 3/8/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation

struct NewsSource: Codable {
    let title: String?
    let articles: [Article]?
}

struct Article: Codable {
    let link: String?
    let description: String?
    let guid: String?
    let title: String?
}
