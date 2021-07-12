//
//  FriendReadingItemCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

class FriendReadingItemCell: UICollectionViewCell {

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var fifthImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
        setupImages()
    }
    
    private func setupLayout() {

        bgView.backgroundColor = UIColor.random
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.cornerRadius = 16
        whiteView.layer.cornerRadius = 16
        whiteView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

    }
    
    private func setupImages() {
        firstImageView.layer.cornerRadius = firstImageView.frame.width / 2
        secondImageView.layer.cornerRadius = secondImageView.frame.width / 2
        thirdImageView.layer.cornerRadius = thirdImageView.frame.width / 2
        fifthImageView.layer.cornerRadius = fifthImageView.frame.width / 2
        fourthImageView.layer.cornerRadius = fourthImageView.frame.width / 2
        bookImage.layer.cornerRadius = 12
    }
    
    func configure(with item: BookModel){
        bookAuthor.text = item.author
        bookTitle.text = item.title
        let imageUrl = item.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        bookImage.kf.setImage( with: URL(string: httpsUrl))
    }

}
