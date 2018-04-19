//
//  LocationCollectionViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class LocationCollectionViewController: UICollectionViewController,
AnimationProtocol, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 7 : 3
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mapCell",
                                                            for: indexPath) as? MapCell
            else {return UICollectionViewCell()}
        let text = indexPath.section == 0 ? "Bus number \(indexPath.row+1)" : "Location \(indexPath.row+1)"
        cell.mainLabel?.text = text
        HomeViewController.layoutCell(cell: cell as UICollectionViewCell)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.85, height: collectionView.frame.height/13)
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "locationHeader",
                                                                             for: indexPath) as? LocationHeader
                else {return UICollectionReusableView()}
            let text = indexPath.section == 0 ? "Bus Routes" : "Locations"
            headerView.headerTitle.text = text
            return headerView
        default:
            assert(false, "Unexpected element kind")
            return UICollectionReusableView()
        }
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MapCell else {return}
        animateWith(duration: 0.4, view: cell.contentView)
    }
}

class LocationHeader: UICollectionReusableView {
    @IBOutlet weak var headerTitle: UILabel!
}
