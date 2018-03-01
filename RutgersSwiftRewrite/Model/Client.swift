//
//  Client.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/13/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import FeedKit



struct Client {
    
    enum OrderedContentKeys {
        case academics
        case services
    }

    static func getOrderedContent(type: OrderedContentKeys, completion: (OrderedContent) -> ()) {
        if let path = Bundle.main.path(forResource: "ordered_content", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                switch type {
                case .academics:
                    let academicContent = try JSONDecoder().decode(AcademicContent.self, from: data)
                    completion(academicContent)
                case .services:
                    let servicesContent = try JSONDecoder().decode(ServicesContent.self, from: data)
                    completion(servicesContent)
                }
            } catch {
                print("error getting local file")
            }
            
        }
    }
    
    static func getNewsFeed(completion: @escaping ([RSSFeedItem])->()) {
        let feedURL = URL(string: "http://www.therutgersreview.com/feed/")
        let parser = FeedParser(URL: feedURL!)
        
        parser?.parseAsync(result: { (result) in
            print(result.rssFeed?.items![0].title)
            print(result.rssFeed?.items![1].title)
            print(result.rssFeed?.items![2].title)
            print(result.rssFeed?.items![3].title)
            guard let feed = result.rssFeed?.items else { return }
            completion(feed)
        })
    }
}
