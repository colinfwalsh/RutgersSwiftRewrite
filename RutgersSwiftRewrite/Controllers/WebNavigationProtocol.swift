//
//  WebNavigationProtocol.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/15/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

protocol WebNavigationProtocol {
    
}

extension WebNavigationProtocol {
    func setUpForWebView(currentView: UIViewController, currentViewName: String, segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back to \(currentViewName)"
        currentView.navigationItem.backBarButtonItem = backItem
        if let destination = segue.destination as? WebViewController {
            destination.serviceURL = sender as! String
        }
    }
}
