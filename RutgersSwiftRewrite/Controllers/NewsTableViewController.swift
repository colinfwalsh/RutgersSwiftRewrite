//
//  NewsTableViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 2/1/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController, AnimationProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsMain", for: indexPath) as! NewsMainCell
            HomeViewController.layoutView(view: cell.articleDisplay)
            HomeViewController.layoutView(view: cell.articleImage)
            cell.articleImage.clipsToBounds = true
            cell.articleTitle.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsAux", for: indexPath) as! NewsAuxCell
            cell.articleLabel.text = "Article 1"
            cell.auxLabel.text = "Other info"
            return cell
        }
    }
    
    override func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height = indexPath.row == 0 ? 350.0 : 50.0
        return CGFloat(height)
    }

}
