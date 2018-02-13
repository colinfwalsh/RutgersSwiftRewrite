//
//  Client.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/13/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation


struct Client {
    
    static func parseOrderedJson(completion: ([OrderedContentItem]) -> ()) {
        if let path = Bundle.main.path(forResource: "ordered_content", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    let orderedContent = try JSONDecoder().decode([OrderedContentItem].self, from: data)
                    //print(orderedContent[2])
                    completion(orderedContent)
                } catch {
                    
                }
            } catch {
                print("error getting local file")
            }
            
        }
        
        
    }
}
