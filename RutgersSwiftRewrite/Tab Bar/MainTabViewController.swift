//
//  MainTabViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 3/2/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit
//Mark for deletion - possible reuse elsewhere
class MainTabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
