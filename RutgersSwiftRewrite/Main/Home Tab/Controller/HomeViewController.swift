//
//  HomeViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/29/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, AnimationProtocol {
    let busStopDataSources = HomeBusCellDataSource<RouteCollectionViewDataSource>()
    let routeDataSource1 = RouteCollectionViewDataSource()
    let routeDataSource2 = RouteCollectionViewDataSource()
    let routeDataSource3 = RouteCollectionViewDataSource()
    @IBOutlet weak var addItem: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeDS = HomeDataSource<String>()
        collectionView.delegate = homeDS
        collectionView.dataSource = homeDS
        LayoutViewManager.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
        busStopDataSources.add(dataSource: routeDataSource1, stop: "Hill Center")
        busStopDataSources.add(dataSource: routeDataSource2, stop: "College Ave Student Center")
        busStopDataSources.add(dataSource: routeDataSource3, stop: "Busch Student Center")
        self.collectionView.register(UINib(nibName: "HomeCell", bundle: nil),
                                     forCellWithReuseIdentifier: "homeCell")
    }
}
