//
//  TestViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 4/6/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var modules = ["rutgers", "bus", "food", "news"]
    var cellWidth: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        cellWidth = view.frame.width - (2*collectionViewFlowLayout.sectionInset.left)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        TestViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
    }
    static func addLeftBarIcon(named: String, navigationItem: UINavigationItem) {
        let logoImage = UIImage.init(named: named)
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x: 0.0, y: 0.0, width: 125, height: 52)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 125)
        let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 52)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        navigationItem.leftBarButtonItem = imageItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TestViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return modules.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moduleCell",
                                                      for: indexPath) as? HomeCampusCell
        cell?.setUpCell(cellWidth: cellWidth)
        if let cell = cell {
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
