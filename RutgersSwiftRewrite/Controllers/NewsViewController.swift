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
        
        layoutCell(cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    private func layoutCell(cell: NewsTableViewCell) {
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1.0
        
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.backgroundColor = UIColor.white.cgColor
        
        let path = UIBezierPath(roundedRect:cell.articleImage.bounds,
                                byRoundingCorners:[.topLeft, .bottomLeft],
                                cornerRadii: CGSize(width: 10, height:  10))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        cell.articleImage.layer.mask = maskLayer
        
//        cell.layer.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0).cgColor
        
        cell.contentView.layer.shadowColor = UIColor.gray.cgColor
        cell.contentView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.contentView.layer.shadowRadius = 1.0
        cell.contentView.layer.shadowOpacity = 2.5
       
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
