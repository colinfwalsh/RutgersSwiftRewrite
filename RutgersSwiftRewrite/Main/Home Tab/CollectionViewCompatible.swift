//
//  CollectionViewCompatible.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 6/4/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

//Can expand as needed
protocol CollectionViewCompatabile {
    var reuseIdentifier: String {get}
    func cellForCollectionView(collectionView: UICollectionView,
                               atIndexPath indexPath: IndexPath) -> UICollectionViewCell
}
