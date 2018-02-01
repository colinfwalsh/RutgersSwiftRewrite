//
//  AcademicsCollectionViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

private let academicItems = ["Sakai" : "url", "Libraries" : "Url", "Pearson e-College" : "url", "Schedule of Classes" : "url"]

class AcademicsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return academicItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "academicCell", for: indexPath) as! AcademicsCell
        
        cell.academicLabel?.text = Array(academicItems.keys)[indexPath.row]
        
        HomeViewController.layoutCell(cell: cell as UICollectionViewCell)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! AcademicsCell
        
        UIView.animate(withDuration: 0.5, animations: {
            cell.testView?.alpha = 1
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            cell.testView?.alpha = 0.55
        })
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
}
