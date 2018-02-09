//
//  AcademicsCollectionViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

private let academicItems = [
    "Sakai" : "https://sakai.rutgers.edu/portal",
    "Libraries" : "https://www.libraries.rutgers.edu/",
    "Pearson e-College" : "https://onlinelearning.rutgers.edu/ecollege",
    "Schedule of Classes" : "https://sis.rutgers.edu/soc/#home"
]

class AcademicsCollectionViewController: UICollectionViewController, AnimationProtocol {

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
        performSegue(withIdentifier: "goToWebView", sender: Array(academicItems.values)[indexPath.row])
        animateWith(duration: 0.4, view: cell.testView)
    }
}

// Could probably be abstracted later on, but this works for now
extension AcademicsCollectionViewController: UICollectionViewDelegateFlowLayout {
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

extension AcademicsCollectionViewController: WebNavigationProtocol {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        setUpForWebView(currentView: self, currentViewName: "Academics", segue: segue, sender: sender)
    }
}
