//
//  HomeViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 1/29/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

//So loading will be done here, before even ViewDidLoad via Dep Injection or something similar
class HomeViewController: UIViewController, AnimationProtocol {
    let homeDataSource = HomeDataSource([HomeCellModel(elements: [Stop(title: "Hill Center",
                                                  routes: [Route(routeTitle: "A",
                                                                 routeColor: UIColor.red,
                                                                 routeEstimate: 5)])])])
   @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //This needs to be set with a custom model
//        LayoutViewManager.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
        self.collectionView.register(UINib(nibName: "HomeCell", bundle: nil),
                                     forCellWithReuseIdentifier: "homeCell")
        self.collectionView.dataSource = homeDataSource
        HomeDataSource.initLayout(self.collectionView)
        collectionView.reloadData()
    }
}
