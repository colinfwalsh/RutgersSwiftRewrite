//
//  ModulesViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 4/17/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class ModulesViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var modules: [OrderedContentItem] = []
    var links: [OrderedContentItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        Client.getOrderedContent { (content) in
            if let modules = content.modules {
                self.modules = modules
            }
            if let links = content.links {
                self.links = links
            }
            print(self.modules)
            collectionView.reloadData()
        }
    }
}
extension ModulesViewController: UICollectionViewDelegate,
                                 UICollectionViewDataSource,
                                 UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modules.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moduleCell",
                                                            for: indexPath)
            as? ModuleCell
            else {return UICollectionViewCell()}
        HomeViewController.layoutCell(cell: cell as UICollectionViewCell)
        cell.titleLabel.text = modules[indexPath.row].title?.text
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionInsets = collectionViewFlowLayout.sectionInset
        let minLineSpacing = collectionViewFlowLayout.minimumLineSpacing
        let cellsPerRow: CGFloat = 3
        let width = (view.frame.width -
            (sectionInsets.right +
                sectionInsets.left) - ((cellsPerRow-1)*minLineSpacing))/cellsPerRow
        return CGSize(width: width, height: width)
    }
}
