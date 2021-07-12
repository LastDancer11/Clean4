//
//  SeriesItemCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit
import Kingfisher

class SeriesItemCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        bgView.backgroundColor = UIColor.random
        bgView.layer.cornerRadius = 10
        firstImage.layer.cornerRadius = 6
        secondImage.layer.cornerRadius = 6
        thirdImage.layer.cornerRadius = 6
        fourthImage.layer.cornerRadius = 6
    }
    
    func configure(with item: BookModel){
        titleLabel.text = item.title
        let imageUrl = item.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        firstImage.kf.setImage( with: URL(string: httpsUrl))
        secondImage.kf.setImage( with: URL(string: httpsUrl))
        thirdImage.kf.setImage( with: URL(string: httpsUrl))
        fourthImage.kf.setImage( with: URL(string: httpsUrl))
    }

}
