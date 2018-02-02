//
//  AnimationProtocol.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 2/2/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

protocol AnimationProtocol {
    func animateWith(duration: Double, view: UIView)
}

extension AnimationProtocol {
    func animateWith(duration: Double, view: UIView) {
        UIView.animate(withDuration: duration, animations: {
            view.alpha = 1
        })
        
        UIView.animate(withDuration: duration, animations: {
            view.alpha = 0.55
        })
    }
}
