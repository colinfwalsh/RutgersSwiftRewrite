//
//  ServicesCollectionViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit


class ServicesCollectionViewController: UICollectionViewController, AnimationProtocol {
    
    let testDictionary = [
        "Student Media" : "https://newbrunswick.rutgers.edu/campus-life/student-media",
        "Student Affairs" : "http://studentaffairs.rutgers.edu/",
        "Resident Life" : "http://ruoncampus.rutgers.edu/",
        "Food" : "http://food.rutgers.edu/",
        "myRutgers" : "https://my.rutgers.edu/",
        "Career Services" : "http://careers.rutgers.edu/",
        "Fix-it" : "https://google.com"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
    }
 
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testDictionary.count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studentServicesCell", for: indexPath) as! StudentServicesCell
        
        cell.servicesTitle.text = Array(testDictionary.keys)[indexPath.row]
        HomeViewController.layoutCell(cell: cell as UICollectionViewCell)

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! StudentServicesCell
        performSegue(withIdentifier: "goToWebView", sender: Array(testDictionary.values)[indexPath.row])
        animateWith(duration: 0.4, view: cell.auxView)
    }
}

extension ServicesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.width/2.25, height: self.collectionView!.frame.height/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}

extension ServicesCollectionViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back to Services"
        navigationItem.backBarButtonItem = backItem
        if let destination = segue.destination as? WebViewController {
            destination.serviceURL = sender as! String
        }
    }
}
