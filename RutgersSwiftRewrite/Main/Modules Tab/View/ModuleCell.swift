//
//  ModuleCell.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 4/24/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class ModuleCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    func setUpCell() {
        self.layer.cornerRadius = 10
        self.backgroundColor =  .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
