//
//  HomeViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/29/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, AnimationProtocol {
    let datasource = HomeBusCellDataSource()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        LayoutViewManager.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
        self.setupXibs()
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
        
        guard let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "homeBusCell",
                                               for: indexPath) as? HomeBusCell
            else {return UICollectionViewCell()}
//        HomeBusCell.setupCell(cell)
        cell.tableView.register(UINib(nibName: "SavedStopCell", bundle: nil), forCellReuseIdentifier: "savedStopCell")
        cell.tableView.isScrollEnabled = false
        cell.tableView.delegate = self
        cell.tableView.dataSource = datasource
        
        LayoutViewManager.layoutCell(cell: cell as UICollectionViewCell)
        return cell
    }
    func setupXibs() {
        self.collectionView.register(UINib(nibName: "HomeBusCell", bundle: nil),
                                     forCellWithReuseIdentifier: "homeBusCell")
    }
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "savedStopCell")
                as? SavedStopCell
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

class HomeHeaderView: UICollectionReusableView {
    @IBOutlet weak var label: UILabel!
}
