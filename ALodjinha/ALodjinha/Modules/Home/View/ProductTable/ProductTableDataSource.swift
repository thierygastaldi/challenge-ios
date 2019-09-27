//
//  ProductTableDataSource.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

class ProductTableDataSource: NSObject, UITableViewDataSource {
    var products = Products()
    var categories: Categories?
    var banners: Banners?
    var homeSections: [HomeSection] = []
    var categoryCollectionDelegate: CategoryCollectionDelegate?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let homeSection = homeSections[section]
        switch homeSection {
        case .banner:
            return 1
        case .category:
            return 1
        case .product:
            return products.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeSection = homeSections[indexPath.section]
        switch homeSection {
        case .banner:
            let cell = tableView.dequeueReusableCell(for: indexPath) as BannerTableViewCell
            cell.render(self.banners)
            return cell
        case .category:
            let cell = tableView.dequeueReusableCell(for: indexPath) as CategoryTableViewCell
            cell.render(self.categories)
            cell.delegate = self.categoryCollectionDelegate
            return cell
        case .product:
            let cell = tableView.dequeueReusableCell(for: indexPath) as ProductTableViewCell
            let product = self.products[indexPath.row]
            cell.render(product)
            return cell
        }
    }
}
