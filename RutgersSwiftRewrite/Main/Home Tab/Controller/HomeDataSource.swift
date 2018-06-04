//
//  HomeDataSource.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

class HomeDataSource<T>: NSObject,
                         UICollectionViewDataSource,
                         UICollectionViewDelegate,
                         UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell",
                                               for: indexPath) as? HomeCell
            else {return UICollectionViewCell()}
        cell.tableView.register(UINib(nibName: "SavedStopCell", bundle: nil), forCellReuseIdentifier: "savedStopCell")
        //Fix these
//        cell.tableView.isScrollEnabled = false
//        cell.tableView.delegate = busStopDataSources
//        cell.tableView.dataSource = busStopDataSources
        LayoutViewManager.layoutCell(cell: cell as UICollectionViewCell)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = indexPath.section == 0 ?
            CGSize(width: collectionView.frame.width * 0.85,
                   height: (collectionView.frame.height/5) * CGFloat(3)) :
            CGSize(width: collectionView.frame.width * 0.85,
                   height: collectionView.frame.height/13)
        return size
    }
}
