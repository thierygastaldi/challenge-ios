//
//  ProductPriceTableViewCell.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductPriceTableViewCell: UITableViewCell, NibLoadableView, ReusableView {
    
    @IBOutlet weak var priceFromLabel: UILabel!
    @IBOutlet weak var priceToLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func render(_ product: Product) {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: String(format:"De: %.02f", product.priceFrom))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        self.priceFromLabel.attributedText = attributeString
        self.priceToLabel.text = String(format:"Por %.02f", product.priceTo)
    }
    
}
