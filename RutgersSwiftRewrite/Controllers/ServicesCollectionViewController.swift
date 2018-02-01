//
//  ServicesCollectionViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit


class ServicesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let testDictionary = ["Student Media" : "url", "Student Affairs" : "url", "Resident Life" : "url", "Food" : "url", "myRutgers" : "url", "Career Services" : "url", "Fix-it" : "url"]

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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! StudentServicesCell
        
        UIView.animate(withDuration: 0.4) {
            cell.auxView.alpha = 1.0
        }
        
        UIView.animate(withDuration: 0.4) {
            cell.auxView.alpha = 0.55
        }
    }
    

}
