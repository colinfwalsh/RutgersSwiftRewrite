//
//  RouteCollectionViewDataSource.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/29/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

class RouteCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var data = [CollectionViewCompatabile]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.row]
        return model.cellForCollectionView(collectionView: collectionView, atIndexPath: indexPath)
    }
}
//    let routeArray = ["A", "B", "C", "RexB", "RexL", "F", "Wkd1", "Wkd2"]
//    let routeColors = [UIColor(red: 1.00, green: 0.00, blue: 1.00, alpha: 1.0),
//                       UIColor(red: 1.00, green: 0.80, blue: 0.60, alpha: 1.0),
//                       UIColor(red: 0.00, green: 1.00, blue: 1.00, alpha: 1.0),
//                       UIColor(red: 0.60, green: 0.20, blue: 0.40, alpha: 1.0),
//                       UIColor(red: 0.40, green: 0.60, blue: 1.00, alpha: 1.0),
//                       UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.0),
//                       UIColor(red: 0.00, green: 0.50, blue: 0.50, alpha: 1.0),
//                       UIColor(red: 0.40, green: 0.40, blue: 0.60, alpha: 1.0)]
//    let routeTimes = ["1 min", "5 min", "10 min", "6 min", "7 min", "9 min", "3 min"]
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return routeArray.count
//    }
//    func collectionView(_ collectionView: UICollectionView,
//                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "routeCell",
//                                                            for: indexPath)
//            as? RouteCell else {return UICollectionViewCell()}
//        cell.routeTitle.text = routeArray[indexPath.row]
//        cell.routeColorView.backgroundColor = routeColors[indexPath.row]
//        let randomIndex = Int(arc4random_uniform(UInt32(routeTimes.count)))
//        cell.routeEstimateTime.text = routeTimes[randomIndex]
//        return cell
//    }
//    static func initLayout(_ collectionView: UICollectionView) {
//        let flowLayout = UICollectionViewFlowLayout()
////        flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
//        flowLayout.itemSize = CGSize(width: collectionView.frame.size.width/6, height: collectionView.frame.size.height)
//        flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
//        flowLayout.minimumInteritemSpacing = 0.0
//        collectionView.collectionViewLayout = flowLayout
//    }
//}
