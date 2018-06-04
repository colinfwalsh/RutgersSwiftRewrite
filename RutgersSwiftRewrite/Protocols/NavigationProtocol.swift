//
//  WebNavigationProtocol.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/15/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

//protocol NavigationProtocol {
//}
//
//extension NavigationProtocol {
//    func performNavigation(currentView: UIViewController, selectedItem: OrderedContentItem) {
//        switch selectedItem.view! {
//        case "www":
//            currentView.performSegue(withIdentifier: "goToWebView", sender: selectedItem)
//        case "food":
//            print("navigating to food view")
//            currentView.performSegue(withIdentifier: "showFood", sender: selectedItem)
//        case "dtable":
//            print("navigating to dtable view")
//            currentView.performSegue(withIdentifier: "showDTable", sender: selectedItem)
//        case "soc":
//            print("navigating to soc view")
//            currentView.performSegue(withIdentifier: "showSoc", sender: selectedItem)
//        case "feedback":
//            print("navigating to feedback view")
//            currentView.performSegue(withIdentifier: "showFeedBack", sender: selectedItem)
//        case "ruinfo":
//            print("navigating to ruinfo view")
//        case "bus":
//            print("navigating to bus view")
//        default:
//            print("error performing navigation")
//        }
//    }
//    func prepareForNavigation(currentView: UIViewController,
//                              currentViewName: String,
//                              selectedItem: OrderedContentItem,
//                              segue: UIStoryboardSegue) {
//        switch selectedItem.view! {
//        case "www":
//            setUpWebView(currentView: currentView,
//                         currentViewName: currentViewName,
//                         segue: segue,
//                         destinationName: "",
//                         url: selectedItem.url!)
//        case "food":
//            print("prepare for food view")
//            setUpFoodView(currentView: currentView,
//                          currentViewName: currentViewName,
//                          segue: segue,
//                          destinationName: (selectedItem.title?.text)!)
//        case "dtable":
//            print("prepare for dtable view")
//            setUpDTableView(currentView: currentView,
//                            currentViewName: currentViewName,
//                            segue: segue,
//                            destinationName: (selectedItem.title?.text)!)
//        case "soc":
//            print("prepare for soc view")
//            setUpSOCView(currentView: currentView,
//                         currentViewName: currentViewName,
//                         segue: segue,
//                         destinationName: (selectedItem.title?.text)!)
//        case "feedback":
//            print("prepare for feedback view")
//            setUpFeedBackView(currentView: currentView,
//                              currentViewName: currentViewName,
//                              segue: segue,
//                              destinationName: (selectedItem.title?.text)!)
//        case "ruinfo":
//            print("prepare for ruinfo view")
//        case "bus":
//            print("prepare for bus view")
//        default:
//            print("error preparing for navigation")
//        }
//    }
//    private func setUpBackButton(view: UIViewController, backText: String) {
//        let backItem = UIBarButtonItem()
//        backItem.title = backText
//        view.navigationItem.backBarButtonItem = backItem
//    }
//    func setUpWebView(currentView: UIViewController,
//                      currentViewName: String,
//                      segue: UIStoryboardSegue,
//                      destinationName: String,
//                      url: String) {
//        setUpBackButton(view: currentView, backText: currentViewName)
//        if let destination = segue.destination as? WebViewController {
//            destination.serviceURL = url
//        }
//    }
//    func setUpFoodView(currentView: UIViewController,
//                       currentViewName: String,
//                       segue: UIStoryboardSegue,
//                       destinationName: String) {
//        setUpBackButton(view: currentView, backText: currentViewName)
//        if let destination = segue.destination as? FoodViewController {
//            destination.navigationItem.title = destinationName
//        }
//    }
//    func setUpSOCView(currentView: UIViewController,
//                      currentViewName: String,
//                      segue: UIStoryboardSegue,
//                      destinationName: String) {
//        setUpBackButton(view: currentView, backText: currentViewName)
//        if let destination = segue.destination as? SOCViewController {
//            destination.navigationItem.title = destinationName
//        }
//    }
//    func setUpDTableView(currentView: UIViewController,
//                         currentViewName: String,
//                         segue: UIStoryboardSegue,
//                         destinationName: String) {
//        setUpBackButton(view: currentView, backText: currentViewName)
//        if let destination = segue.destination as? DTableViewController {
//            destination.navigationItem.title = destinationName
//        }
//    }
//    func setUpFeedBackView(currentView: UIViewController,
//                           currentViewName: String,
//                           segue: UIStoryboardSegue,
//                           destinationName: String) {
//        setUpBackButton(view: currentView, backText: currentViewName)
//        if let destination = segue.destination as? FeedBackViewController {
//            destination.navigationItem.title = destinationName
//        }
//    }
//}
