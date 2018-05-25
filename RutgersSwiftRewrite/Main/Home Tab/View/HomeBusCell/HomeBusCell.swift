//
//  HomeBusCell.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/25/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class HomeBusCell: UICollectionViewCell {
    @IBOutlet weak var tableView: UITableView!
    static func setupCell (_ cell: HomeBusCell) {
        cell.tableView.register(UINib(nibName: "SavedStopCell", bundle: nil), forCellReuseIdentifier: "savedStopCell")
        cell.tableView.isScrollEnabled = false
    }
}
