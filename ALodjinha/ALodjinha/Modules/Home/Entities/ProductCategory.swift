//
//  ProductCategory.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit
import SwiftyJSON

struct CategoryResponse {
    let categories: Categories
    
    init(json: JSON) {
        categories = CategoryMapper.parse(array: json["data"].arrayValue)
    }
}

struct CategoryMapper {
    
    static func parse(array: [JSON]) -> Categories {
        let categories = array.map({ (json) -> ProductCategory in
            return ProductCategory(json: json)
        })
        return categories
    }
}

typealias Categories = [ProductCategory]

struct ProductCategory {
    let descriptionText: String
    let id: Int
    let imageUrl: String
    
    init(json: JSON) {
        descriptionText = json["descricao"].stringValue
        id = json["id"].intValue
        imageUrl = json["urlImagem"].stringValue
    }
}
