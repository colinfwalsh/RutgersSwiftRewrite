//
//  HomeDataSource.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/31/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
    var data: [HomeCellModel]
    init(_ data: [HomeCellModel]) {
        self.data = data
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.row]
        return model.cellForCollectionView(collectionView: collectionView, atIndexPath: indexPath)
    }
    static func initLayout(_ collectionView: UICollectionView) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        flowLayout.itemSize =
            CGSize(width: collectionView.frame.width * 0.85,
                   height: (collectionView.frame.height/5))
        collectionView.collectionViewLayout = flowLayout
    }
}
