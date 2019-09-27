//
//  ProductImageTableViewCell.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductImageTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func render(_ product: Product) {
        nameLabel.text = product.name
        if let imageUrl = URL(string: product.imageUrl) {
            self.photoImageView.af_setImage(withURL: imageUrl)
        }
    }
    
}
