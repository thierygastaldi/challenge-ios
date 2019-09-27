//
//  HomeInteractor.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol?
    
    func fetchBestSellerProducts() {
        let url = "produto/maisvendidos"
        RestApiManager.sharedInstance.makeHTTPGetRequest(url) { (result, error) in
            guard error == nil else {
                self.presenter?.onError(with: error!.localizedDescription)
                return
            }
            let response: ProductResponse = ProductResponse(json: result)
            self.presenter?.didFetchBestSellerProducts(with: response)
        }
    }
    
    func fetchCategories() {
        let url = "categoria"
        RestApiManager.sharedInstance.makeHTTPGetRequest(url) { (result, error) in
            guard error == nil else {
                self.presenter?.onError(with: error!.localizedDescription)
                return
            }
            let response: CategoryResponse = CategoryResponse(json: result)
            self.presenter?.didFetchCategories(with: response)
        }
    }
    
    func fetchBanners() {
        let url = "banner"
        RestApiManager.sharedInstance.makeHTTPGetRequest(url) { (result, error) in
            guard error == nil else {
                self.presenter?.onError(with: error!.localizedDescription)
                return
            }
            let response: BannerResponse = BannerResponse(json: result)
            self.presenter?.didFetchBanners(with: response)
        }
    }
}
