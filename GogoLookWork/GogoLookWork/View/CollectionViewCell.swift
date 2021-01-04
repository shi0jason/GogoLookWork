//
//  CollectionViewCell.swift
//  GogoLookWork
//
//  Created byJason on 2021/1/3.
//  Copyright © 2021Jason. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var SDateLabel: UILabel!
    @IBOutlet weak var EDateLabel: UILabel!

    private var item: TopObject?

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    func setUI() {
        rankLabel.textColor = UIColor.red
        titleLabel.font = UIFont.systemFont(ofSize: 10)
    }
    
    func configure(_ item: TopObject?) {
        self.item = item
        guard let item = item else { return }
        favoriteImageView.image = UIImage(named: DefaultHelper.getFlag(at: item.id) ? "favorite" : "unFavorite")
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

    @IBAction func favoriteAction(_ sender: Any) {
        if let item = self.item {
            DefaultHelper.setFlag(at: item.id)
            favoriteImageView.image = UIImage(named: DefaultHelper.getFlag(at: item.id) ? "favorite" : "unFavorite")
        }
    }
}
