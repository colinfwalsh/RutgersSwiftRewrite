//
//  ModulesViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 4/17/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class ModulesViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var modulesCollectionView: UICollectionView!
    let moduleDataSource = ModuleDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        LayoutViewManager.addLeftBarIcon(named: "logo", navigationItem: navigationItem)
        //Abstract this
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        //Asbstract this as well
        modulesCollectionView.register(ModuleCell.self,
                                       forCellWithReuseIdentifier: "moduleCell")
        modulesCollectionView.dataSource = moduleDataSource
        modulesCollectionView.delegate = moduleDataSource
    }
}
