//
//  RouteCell.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/29/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class RouteCell: UICollectionViewCell {
    @IBOutlet weak var routeColorView: UIView!
    @IBOutlet weak var routeTitle: UILabel!
    @IBOutlet weak var routeEstimateTime: UILabel!
    @IBOutlet weak var cellContainer: UIView!
    override func draw(_ rect: CGRect) {
        self.routeColorView.layer.cornerRadius = self.routeColorView.frame.size.width*0.5
//        self.layer.cornerRadius = self.frame.size.width/2
    }
}
