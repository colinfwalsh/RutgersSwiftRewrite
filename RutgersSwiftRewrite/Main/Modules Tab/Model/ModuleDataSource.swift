//
//  ModuleDataSource.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 4/20/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class ModuleDataSource: NSObject {
}

extension ModuleDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "moduleCell",
                                 for: indexPath) as? ModuleCell
            else {return UICollectionViewCell()}
        cell.moduleLabel?.text = "Test"
        return cell
    }
}

extension ModuleDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}

extension ModuleDataSource: UICollectionViewDelegate {
}
