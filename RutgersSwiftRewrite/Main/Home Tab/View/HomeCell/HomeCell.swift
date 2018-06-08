//
//  HomeCell.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/25/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell, Configurable {
    typealias ModelData = [TableViewCompatible]
    var model: [TableViewCompatible]?
    @IBOutlet weak var tableView: UITableView!
    func configureWithModel(_ model: [TableViewCompatible]) {
        self.model = model
        // swiftlint:disable force_cast
        tableView.dataSource = HomeBusCellDataSource(data: self.model! as! [Stop])
        tableView.reloadData()
    }

}
