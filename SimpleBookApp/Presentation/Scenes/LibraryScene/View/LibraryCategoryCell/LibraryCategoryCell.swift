//
//  LibraryCategoryCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 7/12/21.
//

import UIKit

class LibraryCategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with categoryName: String) {
        self.categoryNameLabel.text = categoryName
    }

}
