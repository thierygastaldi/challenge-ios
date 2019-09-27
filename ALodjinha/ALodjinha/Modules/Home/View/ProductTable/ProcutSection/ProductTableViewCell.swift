//
//  ProductTableViewCell.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceFromLabel: UILabel!
    @IBOutlet weak var priceToLabel: UILabel!
    @IBOutlet weak var signImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.signImageView.image = UIImage(named: "ic_sign")?.withColor(.primaryColor)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func render(_ product: Product) {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: String(format:"De: %.02f", product.priceFrom))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        self.priceFromLabel.attributedText = attributeString
        
        self.priceToLabel.text = String(format:"R$ %.02f", product.priceTo)
        self.nameLabel.text = product.name
        
        if let imageUrl = URL(string: product.imageUrl) {
            self.photoImageView.af_setImage(withURL: imageUrl)
        }
    }
}
