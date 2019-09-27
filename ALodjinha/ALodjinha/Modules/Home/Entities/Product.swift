//
//  Product.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit
import SwiftyJSON

struct ProductResponse {
    let products: Products
    
    init(json: JSON) {
        products = ProductMapper.parse(array: json["data"].arrayValue)
    }
}

struct ProductMapper {
    
    static func parse(array: [JSON]) -> Products {
        let products = array.map({ (json) -> Product in
            return Product(json: json)
        })
        return products
    }
}

typealias Products = [Product]

struct Product {
    let descriptionText: String
    let id: Int
    let name: String
    let priceFrom: Float
    let priceTo: Float
    let imageUrl: String
    let category: ProductCategory
    
    init(json: JSON) {
        descriptionText = json["descricao"].stringValue
        id = json["id"].intValue
        name = json["nome"].stringValue
        priceFrom = json["precoDe"].floatValue
        priceTo = json["precoPor"].floatValue
        imageUrl = json["urlImagem"].stringValue
        category = ProductCategory(json: json["categoria"])
    }
}
