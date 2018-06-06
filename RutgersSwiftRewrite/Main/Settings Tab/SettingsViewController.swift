//
//  SettingsViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 4/19/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        cell.textLabel?.text = "Setting \(indexPath.row + 1)"
        return cell
    }
}
