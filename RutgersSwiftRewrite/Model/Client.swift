//
//  Client.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/13/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation


struct Client {
    
    static func parseOrderedJson(completion: (OrderedContent) -> ()) {
        if let path = Bundle.main.path(forResource: "ordered_content", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    let orderedContent = try JSONDecoder().decode(OrderedContent.self, from: data)
                    
                    completion(orderedContent)
                } catch {
                    
                }
            } catch {
                print("error getting local file")
            }
            
        }
        
        
    }
}
