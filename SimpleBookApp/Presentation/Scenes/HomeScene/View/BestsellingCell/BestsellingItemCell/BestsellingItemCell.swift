//
//  BestsellingItemCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

class BestsellingItemCell: UICollectionViewCell {

    @IBOutlet weak var bookPosterImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with book: BookModel) {
        let imageUrl = book.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        let url = URL(string: httpsUrl)
        bookPosterImageView.kf.setImage(with: url)
        bookNameLabel.text = book.title
        bookAuthorLabel.text = book.author
    }

}
