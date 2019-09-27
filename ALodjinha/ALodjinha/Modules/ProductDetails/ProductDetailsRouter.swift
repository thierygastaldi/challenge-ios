//
//  ProductDetailsRouter.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailsRouter: ProductDetailsRouterProtocol {
    var view: ProductDetailsViewProtocol?
    
    static func createProductDetailModule(with product: Product) -> UIViewController {
        if let view = storyboard.instantiateViewController(withIdentifier: "ProductDetailsView") as? ProductDetailsView {
            let interactor: ProductDetailsInteractorInputProtocol = ProductDetailsInteractor()
            let presenter: ProductDetailsPresenterProtocol & ProductDetailsInteractorOutputProtocol = ProductDetailsPresenter()
            let router: ProductDetailsRouterProtocol = ProductDetailsRouter()
            
            router.view = view
            view.presenter = presenter
            view.product = product
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            interactor.presenter = presenter
            
            return view
        }
        
        return UIViewController()
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "ProductDetails", bundle: Bundle.main)
    }
    
    func showSuccessReservationMessage() {
        if let sourceView = view as? UIViewController {
            BaseAlert.message(sourceView, message: "Produto reservado com sucesso") {
                sourceView.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func showErrorMessage(_ message: String) {
        if let sourceView = view as? UIViewController {
            BaseAlert.error(sourceView, message: message) {}
        }
    }
}
