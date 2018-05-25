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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "savedStopCell")
                as? SavedStopCell
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

