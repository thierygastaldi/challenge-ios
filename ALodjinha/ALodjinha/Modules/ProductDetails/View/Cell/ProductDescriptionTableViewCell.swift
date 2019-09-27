//
//  ProductDescriptionTableViewCell.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit

class ProductDescriptionTableViewCell: UITableViewCell, NibLoadableView, ReusableView {
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(_ product: Product) {
        self.productDescriptionLabel.attributedText = product.descriptionText.html2AttributedString
    }
    
}
