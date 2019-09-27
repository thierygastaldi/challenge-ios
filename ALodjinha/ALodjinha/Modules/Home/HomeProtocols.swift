//
//  HomeProtocols.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    
    func setupView()
    func setupTableView()
    func addRefreshControl()
    func showProducts(_ products: Products)
    func showCategories(_ categories: Categories)
    func showBanners(_ banners: Banners)
    func setLoading(_ loading: Bool)
    func showReloadErrorView()
    func hideReloadErrorView()
}

protocol HomeRouterProtocol: class {
    var view: HomeViewProtocol? { get set }
    static func createHomeModule() -> UIViewController
    func showProductDetails(with product: Product)
    func showCategory(_ category: ProductCategory)
    func showErrorMessage(_ message: String)
}

protocol HomeInteractorInputProtocol: class {
    var presenter: HomeInteractorOutputProtocol? { get set }
    
    func fetchBestSellerProducts()
    func fetchCategories()
    func fetchBanners()
}

protocol HomeInteractorOutputProtocol: class {
    func didFetchBestSellerProducts(with response: ProductResponse)
    func didFetchCategories(with response: CategoryResponse)
    func didFetchBanners(with response: BannerResponse)
    func onError(with message: String)
}

protocol HomePresenterProtocol: class {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
    func reloadButtonTouched()
    func refreshControlValueChanged()
    func didClickOnProduct(_ product: Product)
    func didClickOnCategory(_ category: ProductCategory)
}
