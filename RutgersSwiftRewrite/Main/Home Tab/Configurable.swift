//
//  Configurable.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation

protocol Configurable {
    associatedtype Prototype
    var model: Prototype? {get set}
    func configureWithModel(_ model: Prototype)
}
