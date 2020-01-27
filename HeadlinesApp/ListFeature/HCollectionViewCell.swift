//
//  HeadlineCollectionViewCell.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/18/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//

import UIKit

class HCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.numberOfLines = 0
        image?.layer.cornerRadius = 8
        image?.layer.masksToBounds = true
    }
    
    func setupCell(for item: ItemViewData) {
        self.image?.loadImage(urlString: item.image)
        self.titleLabel?.text = item.title
    }

}
