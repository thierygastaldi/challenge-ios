//
//  CategoryRouter.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

class CategoryRouter: CategoryRouterProtocol {
    var view: CategoryViewProtocol?
    
    static func createCategoryModule(with category: ProductCategory) -> UIViewController {
        if let view = storyboard.instantiateViewController(withIdentifier: "CategoryView") as? CategoryView {
            let presenter: CategoryPresenterProtocol & CategoryInteractorOutputProtocol = CategoryPresenter()
            let router: CategoryRouterProtocol = CategoryRouter()
            let interactor: CategoryInteractorInputProtocol = CategoryInteractor()
            
            router.view = view
            interactor.presenter = presenter
            view.category = category
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            
            return view
        }
        
        return UIViewController()
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Category", bundle: Bundle.main)
    }
    
    func showProductDetails(with product: Product) {
        let productDetailsModule = ProductDetailsRouter.createProductDetailModule(with: product)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(productDetailsModule, animated: true)
        }
    }
    
    func showErrorMessage(_ message: String) {
        if let sourceView = view as? UIViewController {
            BaseAlert.error(sourceView, message: message) {}
        }
    }
}
