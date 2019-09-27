//
//  Banner.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import SwiftyJSON

struct BannerResponse {
    let banners: Banners
    
    init(json: JSON) {
        banners = BannerMapper.parse(array: json["data"].arrayValue)
    }
}

struct BannerMapper {
    
    static func parse(array: [JSON]) -> Banners {
        let banners = array.map({ (json) -> Banner in
            return Banner(json: json)
        })
        return banners
    }
}

typealias Banners = [Banner]

struct Banner {
    let descriptionText: String
    let imageUrl: String
    let linkUrl: String
    
    init(json: JSON) {
        descriptionText = json["descricao"].stringValue
        imageUrl = json["urlImagem"].stringValue
        linkUrl = json["linkUrl"].stringValue
    }
}
