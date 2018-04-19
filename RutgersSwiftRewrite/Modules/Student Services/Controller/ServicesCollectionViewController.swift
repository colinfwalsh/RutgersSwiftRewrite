//
//  ServicesCollectionViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class ServicesCollectionViewController: UICollectionViewController,
                                        AnimationProtocol {
    private var servicesContent: [OrderedContentItem] = [] {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeViewController.addLeftBarIcon(named: "logo", navigationItem: navigationItem)

        Client.getOrderedContent(type: .services) { (orderedContent) in
            guard let data = orderedContent as? ServicesContent else {return}
            self.servicesContent = data.servicesContent

        }
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return servicesContent.count
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studentServicesCell",
                                                            for: indexPath) as? StudentServicesCell
            else {return UICollectionViewCell()}
        cell.servicesTitle.text = servicesContent[indexPath.row].title?.text
        HomeViewController.layoutCell(cell: cell as UICollectionViewCell)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? StudentServicesCell else {return}
        performNavigation(currentView: self, selectedItem: servicesContent[indexPath.row])

        animateWith(duration: 0.4, view: cell.auxView)
    }
}

extension ServicesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.width/2.25, height: self.collectionView!.frame.height/4)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}
extension ServicesCollectionViewController: NavigationProtocol {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = sender as? OrderedContentItem else {return}
        prepareForNavigation(currentView: self,
                             currentViewName: "Services",
                             selectedItem: item, segue: segue)
    }
}
