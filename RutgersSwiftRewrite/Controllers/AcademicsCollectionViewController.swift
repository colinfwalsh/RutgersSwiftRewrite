//
//  AcademicsCollectionViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit




class AcademicsCollectionViewController: UICollectionViewController, AnimationProtocol {
    
    private var academicContent: [OrderedContentItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
        
      /* I'm not sure if you added these lines or I did, but they are unecessary since we're subclassing from UICollectionViewController.
        All of the delegate/dataSource methods are available to us so long as we use the 'override' keyword before the necessary function.
       */
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        Client.parseOrderedJson() { orderedContent in
            self.academicContent = orderedContent.academicContent
           //Instead, make a didSet observer on the academicContent property and update the collectionView there
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }

        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.academicContent.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "academicCell", for: indexPath) as! AcademicsCell
        cell.academicLabel?.text = self.academicContent[indexPath.row].title?.text
        HomeViewController.layoutCell(cell: cell as UICollectionViewCell)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! AcademicsCell
      //Have multiple cases for 'www', 'food', 'soc', etc.  Figure out a way to abstract this away for reuse in other VC's
        switch academicContent[indexPath.row].view {
            case "www":
                performSegue(withIdentifier: "goToWebView", sender: academicContent[indexPath.row])
            default:
                print("not webview")
        }
        
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
        let item = sender as! OrderedContentItem
      //Same here with previous comment in didSelectItemAt.  Abstract this away and add checks for other views
        switch item.view {
        case "www":
            setUpForWebView(currentView: self, currentViewName: "Academics", segue: segue, sender: item.url)
        default:
            print("not webview")
        }
        
    }
}
