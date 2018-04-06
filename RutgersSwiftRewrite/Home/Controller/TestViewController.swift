//
//  TestViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 4/6/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var things = ["one", "two", "three", "one", "two", "three","one", "two", "three"]
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        collectionView.isPagingEnabled = false
        
        let inset: CGFloat = 25
        let spaceBetweenCells: CGFloat = 15
        let cellWidth = self.view.frame.width - (inset*2) - spaceBetweenCells
        flowLayout.minimumLineSpacing = spaceBetweenCells
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        flowLayout.itemSize = CGSize(width: cellWidth, height: 100)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return things.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! TestCollectionViewCell
        cell.setUpCell()
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Stop scrollView sliding:
        targetContentOffset.pointee = scrollView.contentOffset
        let indexPath = IndexPath(row: indexOfMajorCell(), section: 0)
        flowLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private func indexOfMajorCell() -> Int {
        let itemWidth = flowLayout.itemSize.width
        let proportionalOffset = flowLayout.collectionView!.contentOffset.x / itemWidth
        return Int(round(proportionalOffset))
    }
}


