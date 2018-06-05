//
//  HomeBusCellDataSource.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/25/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

class HomeBusCellDataSource: NSObject, UITableViewDataSource {
    var data: [TableViewCompatible]
    init(data: [TableViewCompatible]) {
        self.data = data
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = data[indexPath.row]
        return model.cellForTableView(tableView: tableView, atIndexPath: indexPath)
    }
}
