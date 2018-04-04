//
//  NewsViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 3/8/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    
    @IBOutlet weak var newsPickerView: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var feed: [Article] = []
    var newsSources: [NewsSource] = []
    
//    let newsPickerView = UIPickerView()
    var pickerTest: [String] = ["one", "two", "three", "four"]
    var rotationAngle: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
  
        newsPickerView.delegate = self
        newsPickerView.dataSource = self
        
        //picker view rotaion
        rotationAngle = -90 * (.pi/180)
        newsPickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)

        //Picker view creation
        newsPickerView.frame = CGRect(x: -150, y: titleLabel.frame.maxY + 10, width: view.frame.width + 300, height: 40)

        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addConstraint(NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: newsPickerView.frame.height + 15))
        tableView.separatorColor = .white
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
     
        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
        Client.getNewsFeeds { (feeds) in
            self.feed = feeds[0].articles!
            self.newsSources = feeds
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        cell.titleLabel.text = feed[indexPath.row].title
        
        cell.layoutCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
}
//MARK: Example Mark
extension NewsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return newsSources.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 250
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        feed = newsSources[row].articles!
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 250, height: 40)
        label.textAlignment = .center
        label.text = newsSources[row].title

        label.transform = CGAffineTransform(rotationAngle: -rotationAngle)

        return label as! UIView
    }
}
