//
//  CategoryPresenter.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation

class CategoryPresenter: CategoryPresenterProtocol {
    var view: CategoryViewProtocol?
    var router: CategoryRouterProtocol?
    var interactor: CategoryInteractorInputProtocol?
    var category: ProductCategory?
    
    func viewDidLoad() {
        self.view?.setupView()
        self.view?.setupTableView()
        if let category = self.view?.category {
            self.category = category
            self.view?.setLoading(true)
            self.interactor?.fetchProducts(with: category)
        }
    }
    
    func didClickOnProduct(_ product: Product) {
        self.router?.showProductDetails(with: product)
    }
    
    func willDisplayLastRow() {
        if let category = self.category {
            self.interactor?.fetchProducts(with: category)
        }
    }
}

extension CategoryPresenter: CategoryInteractorOutputProtocol {
    func didFetchProducts(with response: ProductResponse) {
        self.view?.showProducts(response.products)
        self.view?.setLoading(false)
    }
    
    func onError(with message: String) {
        self.view?.setLoading(false)
        self.router?.showErrorMessage(message)
    }
}
