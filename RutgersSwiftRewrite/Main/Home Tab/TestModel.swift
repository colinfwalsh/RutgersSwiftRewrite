//
//  TestModel.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

class TestModel: TableViewCompatible {
    var reuseIdentifier: String {
        return "homeCell"
    }
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = self.title
        return cell
    }
}
