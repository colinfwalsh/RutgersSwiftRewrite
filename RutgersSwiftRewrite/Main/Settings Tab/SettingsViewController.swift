//
//  SettingsViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 4/19/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        LayoutViewManager.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
