//
//  StoryItemCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

class StoryItemCell: UICollectionViewCell {

    @IBOutlet weak var bookPosterImageView: UIImageView!
    @IBOutlet weak var bookContentLabel: UILabel!
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarView.layer.cornerRadius = 22
        avatarView.layer.borderWidth = 2
        avatarView.layer.borderColor = UIColor.systemBlue.cgColor
        avatarImageView.layer.cornerRadius = 18
        avatarImageView.layer.borderWidth = 2
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func configure(with book: BookModel) {
        let imageUrl = book.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        let url = URL(string: httpsUrl)
        bookPosterImageView.kf.setImage(with: url)
        bookContentLabel.text = book.summary
    }

}
