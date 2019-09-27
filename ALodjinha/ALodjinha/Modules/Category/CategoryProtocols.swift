//
//  CategoryProtocols.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

protocol CategoryViewProtocol: class {
    var presenter: CategoryPresenterProtocol? { get set }
    var category: ProductCategory? { get set }
    
    func setupView()
    func setupTableView()
    func showProducts(_ products: Products)
    func setLoading(_ loading: Bool)
}

protocol CategoryRouterProtocol: class {
    var view: CategoryViewProtocol? { get set }
    static func createCategoryModule(with category: ProductCategory) -> UIViewController
    func showProductDetails(with product: Product)
    func showErrorMessage(_ message: String)
}

protocol CategoryInteractorInputProtocol: class {
    var presenter: CategoryInteractorOutputProtocol? { get set }
    func fetchProducts(with category: ProductCategory)
}

protocol CategoryInteractorOutputProtocol: class {
    func didFetchProducts(with response: ProductResponse)
    func onError(with message: String)
}

protocol CategoryPresenterProtocol: class {
    var view: CategoryViewProtocol? { get set }
    var router: CategoryRouterProtocol? { get set }
    var interactor: CategoryInteractorInputProtocol? { get set }
    
    func viewDidLoad()
    func didClickOnProduct(_ product: Product)
    func willDisplayLastRow()
}
