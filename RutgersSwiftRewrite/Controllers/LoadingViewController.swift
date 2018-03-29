//
//  LoadingViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 3/2/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    var delegate: LoadingViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        // Do your spinner code here
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = .gray
        activityIndicator.center = self.view.center
        self.view.backgroundColor = .clear
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
    }
    
    // Delegate function, should be fired when loading is done.
    func finished() {
        if self.delegate != nil {
            self.delegate?.didFinishLoading(controller: self)
        }
    }
}
