//
//  ServicesCollectionViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit


class ServicesCollectionViewController: UICollectionViewController, AnimationProtocol {
    
    private var servicesContent: [OrderedContentItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
        
        Client.parseOrderedJson() { orderedContent in
            self.servicesContent = orderedContent.servicesContent
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }
    }
 
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servicesContent.count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studentServicesCell", for: indexPath) as! StudentServicesCell
        
        cell.servicesTitle.text = servicesContent[indexPath.row].title?.text
        HomeViewController.layoutCell(cell: cell as UICollectionViewCell)

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! StudentServicesCell
        switch servicesContent[indexPath.row].view {
        case "www":
            performSegue(withIdentifier: "goToWebView", sender: servicesContent[indexPath.row])
        default:
            print("not webview")
        }
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

extension ServicesCollectionViewController: WebNavigationProtocol {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! OrderedContentItem
        switch item.view {
        case "www":
            setUpForWebView(currentView: self, currentViewName: "Academics", segue: segue, sender: item.url)
        default:
            print("not webview")
        }
    }
}



