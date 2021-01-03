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
        setUI()
    }

    func setUI() {
        rankLabel.textColor = UIColor.red
    }
    
    func configure(_ item: TopObject?) {
        guard let item = item else { return }
        if let imageUrl = item.imageUrl {
            if let url = URL(string: imageUrl) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data,
                        let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                    }.resume()
            }
        }
        if let title = item.title {
            titleLabel.text = title
        }
        if let rank = item.rank {
            rankLabel.text = "Rank:\(rank)"
        }
        if let sDate = item.startDate {
            SDateLabel.text = sDate
        }
        if let eDate = item.endDate {
            EDateLabel.text = eDate
        }
    }
}
