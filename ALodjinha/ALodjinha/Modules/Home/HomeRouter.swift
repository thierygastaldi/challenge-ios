//
//  HomeRouter.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    var view: HomeViewProtocol?
    
    static func createHomeModule() -> UIViewController {
        if let view = storyboard.instantiateViewController(withIdentifier: "HomeView") as? HomeView {
            let interactor: HomeInteractorInputProtocol = HomeInteractor()
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let router: HomeRouterProtocol = HomeRouter()
            
            router.view = view
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            interactor.presenter = presenter

            return view
        }
        
        return UIViewController()
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Home", bundle: Bundle.main)
    }
    
    func showProductDetails(with product: Product) {
        let productDetailsModule = ProductDetailsRouter.createProductDetailModule(with: product)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(productDetailsModule, animated: true)
        }
    }
    
    func showCategory(_ category: ProductCategory) {
        let categoryModule = CategoryRouter.createCategoryModule(with: category)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(categoryModule, animated: true)
        }
    }
    
    func showErrorMessage(_ message: String) {
        if let sourceView = view as? UIViewController {
            BaseAlert.error(sourceView, message: message) {}
        }
    }
}
