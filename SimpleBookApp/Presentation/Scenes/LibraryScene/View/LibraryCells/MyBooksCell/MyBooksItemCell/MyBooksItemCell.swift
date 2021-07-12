//
//  MyBooksCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 7/12/21.
//

import UIKit

class MyBooksItemCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var bigBookPosterView: UIView!
    @IBOutlet weak var bigBookPosterImageView: UIImageView!
    @IBOutlet weak var bookPosterImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var bookContentLabel: UILabel!
    
    // MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupContentView()
        setupBigBookPosterImageView()
        setupBigBookPosterView()
    }
    
    // MARK: - Setupers
    private func setupContentView() {
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.cornerRadius = 16
    }
    
    private func setupBigBookPosterView() {
        self.bigBookPosterView.clipsToBounds = true
        self.bigBookPosterView.layer.cornerRadius = 16
        self.bigBookPosterView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func setupBigBookPosterImageView() {
        self.layoutIfNeeded()
        self.bigBookPosterImageView.clipsToBounds = true
        self.bigBookPosterImageView.layer.cornerRadius = 16
        self.bigBookPosterImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    // MARK: - Configure
    func configure(with book: BookModel) {
        let imageUrl = book.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        let url = URL(string: httpsUrl)
        bigBookPosterImageView.kf.setImage(with: url)
        bookPosterImageView.kf.setImage(with: url)
        bookNameLabel.text = book.title
        authorNameLabel.text = book.author
        bookContentLabel.text = book.summary
        
    }

}
