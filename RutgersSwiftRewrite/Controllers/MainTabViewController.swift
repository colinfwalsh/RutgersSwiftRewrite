//
//  MainTabViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 3/2/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

protocol LoadingViewControllerDelegate {
    func didFinishLoading(controller: LoadingViewController)
}

class MainTabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let destination = viewController.childViewControllers[0] as? NewsTableViewController{
            let loading = LoadingViewController(nibName: "LoadingViewController", bundle: nil)
            loading.modalTransitionStyle = .crossDissolve
            loading.modalPresentationStyle = .overFullScreen
//            present(loading, animated: true, completion: nil)
            self.present(loading, animated: true, completion: nil)
            
            Client.getNewsFeed { (feed) in
                DispatchQueue.main.async {
                    destination.feed = feed
                    destination.loading = loading
                    destination.loading?.delegate = destination
                    loading.finished()
                }
            }
        }
        return true
    }
   

}
