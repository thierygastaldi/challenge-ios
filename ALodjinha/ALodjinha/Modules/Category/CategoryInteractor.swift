//
//  CategoryInteractor.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation

class CategoryInteractor: CategoryInteractorInputProtocol {
    var presenter: CategoryInteractorOutputProtocol?
    
    func fetchProducts(with category: ProductCategory) {
//        let url = "produto/\(category.id)"
        let url = "produto"
        RestApiManager.sharedInstance.makeHTTPGetRequest(url) { (result, error) in
            guard error == nil else {
                self.presenter?.onError(with: error!.localizedDescription)
                return
            }
            let response: ProductResponse = ProductResponse(json: result)
            self.presenter?.didFetchProducts(with: response)
        }
    }
}
