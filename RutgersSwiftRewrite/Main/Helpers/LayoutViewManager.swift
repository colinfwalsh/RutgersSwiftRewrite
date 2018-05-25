//
//  LayoutViewManager.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/24/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

struct LayoutViewManager {
    static func addLeftBarIcon(named: String, navigationItem: UINavigationItem) {
        let logoImage = UIImage.init(named: named)
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x: 0.0, y: 0.0, width: 125, height: 52)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 125)
        widthConstraint.isActive = true
        navigationItem.leftBarButtonItem = imageItem
    }
    static func layoutCell(cell: UICollectionViewCell) {
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowOpacity = 2.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath =
            UIBezierPath(roundedRect: cell.bounds,
                         cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }
    static func layoutView(view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.masksToBounds = true
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        view.layer.shadowRadius = 1.0
        view.layer.shadowOpacity = 2.5
        view.layer.masksToBounds = false
        view.layer.shadowPath =
            UIBezierPath(roundedRect: view.bounds,
                         cornerRadius: view.layer.cornerRadius).cgPath
    }
}
