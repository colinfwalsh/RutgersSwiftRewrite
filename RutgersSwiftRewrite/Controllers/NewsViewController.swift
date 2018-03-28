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
    
//    let newsPickerView = UIPickerView()
    var pickerTest: [String] = ["one", "two", "three", "four"]
    var rotationAngle: CGFloat!
    
    let pickerItemWidth = 100
    let pickerItemHeight = 50
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        newsPickerView.delegate = self
        newsPickerView.dataSource = self
        
        newsPickerView.layer.borderColor = UIColor.red.cgColor
        newsPickerView.layer.backgroundColor = UIColor.blue.cgColor
        newsPickerView.layer.borderWidth = 1.5
        
        newsPickerView.backgroundColor = .green
        //picker view rotaion
        rotationAngle = -90 * (.pi/180)

        

        
        self.view.addConstraints([
            NSLayoutConstraint(item: newsPickerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 100),
            NSLayoutConstraint(item: newsPickerView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: view.frame.width),
            NSLayoutConstraint(item: newsPickerView, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1, constant: 0),
            
            NSLayoutConstraint(item: newsPickerView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 5),
            NSLayoutConstraint(item: newsPickerView, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1, constant: -100)
            ])
        

        newsPickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)

        

        print(newsPickerView.constraints)
        
        
        //Picker view creation
//        newsPickerView.frame = CGRect(x: -150, y: titleLabel.frame.maxY + 30, width: view.frame.width + 300, height: 80)
        
        self.view.addSubview(newsPickerView)


        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
//        self.view.addConstraints([
//            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: newsPickerView, attribute: .bottom, multiplier: 1.0, constant: 30)
//        ])
        
        
        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
        Client.getNewsFeeds { (feeds) in
            self.feed = feeds[0].articles!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        cell.titleLabel.text = feed[indexPath.row].title
        return cell
    }
}

extension NewsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerTest.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        return 100
//    }
//
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        return 50
//    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerTest[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let view = UIView()
////        view.frame = CGRect(x: 0, y: 0, width: pickerItemWidth, height: pickerItemHeight)
//
//        let label = UILabel()
////        label.frame = CGRect(x: 0, y: 0, width: pickerItemWidth, height: pickerItemHeight)
//        label.textAlignment = .center
//        label.text = pickerTest[row]
//
//        view.addSubview(label)
//        view.transform = CGAffineTransform(rotationAngle: -rotationAngle)
//
//        return view
//    }
}
