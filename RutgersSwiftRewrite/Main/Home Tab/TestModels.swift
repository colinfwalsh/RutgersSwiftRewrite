//
//  TestModels.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 6/4/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

class HomeBusCell: CollectionViewCompatabile {
    var reuseIdentifier: String {
        return "homeCell"
    }
    var stops: [Stop]
    init(stops: [Stop]) {
        self.stops = stops
    }
    func cellForCollectionView(collectionView: UICollectionView,
                               atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        cell.data = stops
        return cell
    }
}
//Custom protocol for specific view?  Homescreen, module, settings, etc.  Maybe enum?
// So stops should have an array of routes
class Stop: TableViewCompatible {
    var reuseIdentifier: String {
        return "savedStopCell"
    }
    var title: String
    var routes: [Route]
    init(title: String, routes: [Route]) {
        self.title = title
        self.routes = routes
    }
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = self.title
        //cell.collectionView DATA = self.routes
        return cell
    }
}
class Route: CollectionViewCompatabile {
    var reuseIdentifier: String {
        return "routeCell"
    }
    var routeTitle: String
    var routeColor: UIColor
    var routeEstimate: Int
    init(routeTitle: String, routeColor: UIColor = UIColor(), routeEstimate: Int) {
        self.routeTitle = routeTitle
        self.routeColor = routeColor
        self.routeEstimate = routeEstimate
    }
    //Doesn't care what the data is, but it needs to be set
    func cellForCollectionView(collectionView: UICollectionView,
                               atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? RouteCell
                         else {return UICollectionViewCell()}
        cell.routeTitle.text = self.routeTitle
        cell.routeColorView.backgroundColor = self.routeColor
        cell.routeEstimateTime.text = routeEstimate > 1 ?  "\(routeEstimate) mins":"\(routeEstimate) min"
        return UICollectionViewCell()
    }
}
