//
//  HomeCell.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/25/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.reloadData()
        }
    }
}
