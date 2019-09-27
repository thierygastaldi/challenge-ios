//
//  ProductDetailsDataSource.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailsDataSource: NSObject, UITableViewDataSource {
    var product: Product?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(for: indexPath) as ProductImageTableViewCell
            if let product = self.product {
                cell.render(product)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(for: indexPath) as ProductPriceTableViewCell
            if let product = self.product {
                cell.render(product)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(for: indexPath) as ProductDescriptionTableViewCell
            if let product = self.product {
                cell.render(product)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
