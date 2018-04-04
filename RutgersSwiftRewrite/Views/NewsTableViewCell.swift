//
//  NewsTableViewCell.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 3/8/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(16, 16, 16, 16))
        articleImage.clipsToBounds = true
    }
}
