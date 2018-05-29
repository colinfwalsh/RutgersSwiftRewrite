//
//  RouteCollectionViewDataSource.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/29/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

class RouteCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "routeCell", for: indexPath) as? RouteCell else {return UICollectionViewCell()}
        
        cell.routeColorView.backgroundColor = .gray
        cell.routeColorView.layer.cornerRadius = 50
        cell.routeTitle.text = "Test"
        
        return cell
    }
    
    
}
