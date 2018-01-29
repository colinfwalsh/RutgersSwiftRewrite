//
//  HomeCollectionViewCell.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/29/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
 
    override func awakeFromNib() {
    }
    
    func layoutCell() {

        /*
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: .contentView.layer.cornerRadius).cgPath*/
    }
    
}
