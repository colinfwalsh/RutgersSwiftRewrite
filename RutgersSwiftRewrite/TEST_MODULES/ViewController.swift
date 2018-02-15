//
//  ViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/29/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slidingMenu: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var isHiding = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        leadingConstraint.constant = -slidingMenu.frame.width * 2
        self.view.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showHideLeftBar(_ sender: Any) {
        switch isHiding {
        case true:
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            })
        default:
            UIView.animate(withDuration: 0.2, animations: {
                self.leadingConstraint.constant = -self.slidingMenu.frame.width
                self.view.layoutIfNeeded()
            })
        }
        
         isHiding = !isHiding
    }
    
}

