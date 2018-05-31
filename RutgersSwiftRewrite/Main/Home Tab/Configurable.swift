//
//  Configurable.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation

protocol Configurable {
    associatedtype T
    var model: T? {get set}
    func configureWithModel(_ model: T)
}
