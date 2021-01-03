//
//  CollectionViewCell.swift
//  GogoLookWork
//
//  Created byJason on 2021/1/3.
//  Copyright © 2021Jason. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var SDateLabel: UILabel!
    @IBOutlet weak var EDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ item: TopObject?) {
        guard let item = item,
            let imageUrl = item.imageUrl,
            let title = item.title,
            let rank = item.rank,
            let sDate = item.startDate,
            let eDate = item.endDate else { return }
//        imageView.image = imageUrl
        titleLabel.text = title
        rankLabel.text = "\(rank)"
        SDateLabel.text = sDate
        EDateLabel.text = eDate
    }
}
