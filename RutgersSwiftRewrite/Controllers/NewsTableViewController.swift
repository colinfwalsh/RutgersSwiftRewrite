//
//  NewsTableViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 2/1/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit
import FeedKit

class NewsTableViewController: UITableViewController, AnimationProtocol {
    
    var feed: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
        Client.getNewsFeeds { (feeds) in
            self.feed = feeds[0].articles!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return feed.count
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
            
            //print("feed article title \(feed[indexPath.row].title)")
            cell.articleTitle.text = feed[indexPath.section].title
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsAux", for: indexPath) as! NewsAuxCell
            cell.articleLabel.text = feed[indexPath.section].title
            cell.auxLabel.text = "author"
            return cell
        }
    }
    
    override func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height = indexPath.row == 0 ? 350.0 : 50.0
        return CGFloat(height)
    }

}
