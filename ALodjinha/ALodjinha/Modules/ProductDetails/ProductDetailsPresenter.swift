//
//  ProductDetailsPresenter.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation

class ProductDetailsPresenter: ProductDetailsPresenterProtocol {
    var view: ProductDetailsViewProtocol?
    var interactor: ProductDetailsInteractorInputProtocol?
    var router: ProductDetailsRouterProtocol?
    
    func viewDidLoad() {
        self.view?.setupView()
        self.view?.setupTableView()
        self.view?.setupReservationButton()
    }
    
    func reservationButtonTouched(with product: Product) {
        self.view?.loadingReservation(true)
        self.interactor?.makeReservation(with: product)
    }
}

extension ProductDetailsPresenter: ProductDetailsInteractorOutputProtocol {
    func didMakeReservation() {
        self.view?.loadingReservation(false)
        self.router?.showSuccessReservationMessage()
    }
    
    func onError(with message: String) {
        self.view?.loadingReservation(false)
        self.router?.showErrorMessage(message)
    }
}
