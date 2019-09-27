//
//  ProductDetailsInteractor.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation

class ProductDetailsInteractor: ProductDetailsInteractorInputProtocol {
    var presenter: ProductDetailsInteractorOutputProtocol?
    
    func makeReservation(with product: Product) {
        let url = "produto/\(product.id)"
        RestApiManager.sharedInstance.makeHTTPPostRequest(endPointUrl: url, body: []) { (result, error) in
            guard error == nil else {
                self.presenter?.onError(with: error!.localizedDescription)
                return
            }
            self.presenter?.didMakeReservation()
        }
    }
}
