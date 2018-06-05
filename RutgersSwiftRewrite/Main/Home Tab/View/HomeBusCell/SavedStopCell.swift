//
//  SavedStopCell.swift
//  RutgersSwiftRewrite
//
//  Created by Colin Walsh on 5/25/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class SavedStopCell: UITableViewCell, Configurable {
    typealias Prototype = Stop
    @IBOutlet weak var stopTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var model: Prototype?
    func configureWithModel(_ model: Prototype) {
        self.model = model
        self.stopTitle.text = model.title
        //Also init collectionView - hmm maybe another protocol? For collections?
    }
}
