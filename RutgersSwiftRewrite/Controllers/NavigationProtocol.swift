//
//  WebNavigationProtocol.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/15/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationProtocol {
    
}

extension NavigationProtocol {
    
    func performNavigation(currenView: UIViewController, selectedItem: OrderedContentItem) {
        switch selectedItem.view! {
        case "www":
            currenView.performSegue(withIdentifier: "goToWebView", sender: selectedItem)
        case "food":
            print("navigating to food view")
        case "dtable":
            print("navigating to dtable view")
        case "soc":
            print("navigating to soc view")
        case "feedback":
            print("navigating to feedback view")
        case "ruinfo":
            print("navigating to ruinfo view")
        case "bus":
            print("navigating to bus view")
        default:
            print("error performing navigation")
        }
    }
    
    func prepareForNavigation(currentView: UIViewController, currentViewName: String, selectedItem: OrderedContentItem, segue: UIStoryboardSegue) {
        switch selectedItem.view! {
        case "www":
            setUpForWebView(currentView: currentView, currentViewName: currentViewName, segue: segue, url: selectedItem.url!)
        case "food":
            print("prepare for food view")
        case "dtable":
            print("prepare for dtable view")
        case "soc":
            print("prepare for soc view")
        case "feedback":
            print("prepare for feedback view")
        case "ruinfo":
            print("prepare for ruinfo view")
        case "bus":
            print("prepare for bus view")
        default:
            print("error preparing for navigation")
        }
    }
    
    func setUpForWebView(currentView: UIViewController, currentViewName: String, segue: UIStoryboardSegue, url: String) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back to \(currentViewName)"
        currentView.navigationItem.backBarButtonItem = backItem
        if let destination = segue.destination as? WebViewController {
            destination.serviceURL = url
        }
    }
}
