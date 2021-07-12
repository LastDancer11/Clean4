//
//  MainItemCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit
import Kingfisher

class MainItemCell: UICollectionViewCell {

    @IBOutlet weak var bookPosterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with book: BookModel) {
        let imageUrl = book.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        let url = URL(string: httpsUrl)
        bookPosterImageView.kf.setImage(with: url)
    }

}
