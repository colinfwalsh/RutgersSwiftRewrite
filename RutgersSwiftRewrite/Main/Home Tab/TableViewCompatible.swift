//
//  TableViewCompatablie.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewCompatible {
    var reuseIdentifier: String {get}
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
}
