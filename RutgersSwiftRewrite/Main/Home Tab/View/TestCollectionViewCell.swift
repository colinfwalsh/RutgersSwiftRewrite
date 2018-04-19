//
//  TestCollectionViewCell.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 4/6/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    func setUpCell() {
        self.backgroundColor = .gray
        self.layer.cornerRadius = 10
        self.contentView.layer.shadowColor = UIColor.gray.cgColor
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.contentView.layer.shadowRadius = 1.0
        self.contentView.layer.shadowOpacity = 2.5
    }
}
