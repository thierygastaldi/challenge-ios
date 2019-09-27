//
//  CategoryCollectionViewCell.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit
import AlamofireImage

class CategoryCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func render(_ category: ProductCategory) {
        self.nameLabel.text = category.descriptionText
        
        self.photoImageView.image = nil
        if let imageUrl = URL(string: category.imageUrl) {
            self.photoImageView.af_setImage(withURL: imageUrl)
        }
    }
}
