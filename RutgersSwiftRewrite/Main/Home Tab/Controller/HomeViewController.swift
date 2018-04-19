//
//  HomeViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/29/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, AnimationProtocol {
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
    }
    //Clean up
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
}

extension HomeViewController: UICollectionViewDelegate {
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = indexPath.section == 0 ?
            CGSize(width: self.collectionView.frame.width * 0.85,
                   height: self.collectionView.frame.height/5) :
            CGSize(width: collectionView.frame.width * 0.85,
                   height: collectionView.frame.height/13)
        return size
    }
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
//        let cell = self.collectionView.cellForItem(at: indexPath) as? HomeCell
        /*
        if let cell = cell {
            animateWith(duration: 0.4, view: cell.imageView)
        }
 */
        print("Tapped cell!")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch indexPath.section {
//        case 0:
            guard let cell =
                collectionView.dequeueReusableCell(withReuseIdentifier: "homeViewCell",
                                                   for: indexPath) as? HomeCell else {return UICollectionViewCell()}
            HomeViewController.layoutCell(cell: cell as UICollectionViewCell)
//            cell.title.text = "Title"
            return cell
//        default:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mapCell",
//                                                                for: indexPath) as? MapCell
//                else {return UICollectionViewCell()}
//            HomeViewController.layoutCell(cell: cell as UICollectionViewCell)
//            cell.mainLabel?.text = "Favorited item - dependent on type of item"
//            return cell
//        }
    }
    // MARK: Header Implementation
    /*
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "homeHeader",
                                                                             for: indexPath) as? HomeHeaderView
                else {return UICollectionReusableView()}
            let text = indexPath.section == 0 ? "Recents" : "Favorites"
            headerView.label.text = text
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }*/
    static func layoutCell(cell: UICollectionViewCell) {
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowOpacity = 2.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath =
            UIBezierPath(roundedRect: cell.bounds,
                         cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }
    static func layoutView(view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.masksToBounds = true
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        view.layer.shadowRadius = 1.0
        view.layer.shadowOpacity = 2.5
        view.layer.masksToBounds = false
        view.layer.shadowPath =
            UIBezierPath(roundedRect: view.bounds,
                         cornerRadius: view.layer.cornerRadius).cgPath
    }
}

class HomeHeaderView: UICollectionReusableView {
    @IBOutlet weak var label: UILabel!
}
