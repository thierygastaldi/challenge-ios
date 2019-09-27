//
//  HomePresenter.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    let group = DispatchGroup()
    
    func viewDidLoad() {
        self.view?.setupView()
        self.view?.setupTableView()
        self.view?.addRefreshControl()
        self.reloadData()
    }
    
    func viewWillAppear() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    func viewWillDisappear() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func reloadButtonTouched() {
        self.view?.hideReloadErrorView()
        self.reloadData()
    }
    
    func refreshControlValueChanged() {
        self.reloadData()
    }
    
    @objc func reloadData() {
        self.view?.setLoading(true)
        
        self.group.enter()
        self.interactor?.fetchBestSellerProducts()
        
        self.group.enter()
        self.interactor?.fetchCategories()
        
        self.group.enter()
        self.interactor?.fetchBanners()
        
        // Fetch all data
        self.group.notify(queue: .main) {
            self.view?.setLoading(false)
        }
    }
    
    func didClickOnProduct(_ product: Product) {
        self.router?.showProductDetails(with: product)
    }
    
    func didClickOnCategory(_ category: ProductCategory) {
        self.router?.showCategory(category)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func didFetchBestSellerProducts(with response: ProductResponse) {
        self.view?.showProducts(response.products)
        self.group.leave()
    }
    
    func didFetchCategories(with response: CategoryResponse) {
        self.view?.showCategories(response.categories)
        self.group.leave()
    }
    
    func didFetchBanners(with response: BannerResponse) {
        self.view?.showBanners(response.banners)
        self.group.leave()
    }
    
    func onError(with message: String) {
        self.router?.showErrorMessage(message)
        self.view?.showReloadErrorView()
    }
}
