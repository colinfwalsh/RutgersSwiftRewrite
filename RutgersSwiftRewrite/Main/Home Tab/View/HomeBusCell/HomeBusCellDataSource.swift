//
//  HomeBusCellDataSource.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/25/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

class HomeBusCellDataSource <T: UICollectionViewDataSource & UICollectionViewDelegate>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var stopTitles: [String] = []
    var stopDatasources: [T] = []

    //This doesn't need to be generic, but it was mainly to test out generics for future use.  Works as intended

    func add (dataSource: T, stop: String) {
        self.stopTitles.append(stop)
        self.stopDatasources.append(dataSource)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell =
            tableView.dequeueReusableCell(withIdentifier: "savedStopCell")
                as? SavedStopCell
        cell?.stopTitle.text = "@ " + stopTitles[indexPath.row]
        cell?.collectionView.register(UINib(nibName: "RouteCell", bundle: nil), forCellWithReuseIdentifier: "routeCell")
        cell?.collectionView.delegate = self.stopDatasources[indexPath.row]
        cell?.collectionView.dataSource = self.stopDatasources[indexPath.row]
        RouteCollectionViewDataSource.initLayout((cell?.collectionView)!)
        cell?.collectionView.showsHorizontalScrollIndicator = false
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/CGFloat(stopDatasources.count)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stopDatasources.count
    }
    
}

