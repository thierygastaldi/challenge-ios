//
//  ProductDetailsProtocols.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

protocol ProductDetailsViewProtocol: class {
    var presenter: ProductDetailsPresenterProtocol? { get set }
    var product: Product? { get set }
    
    func setupView()
    func setupReservationButton()
    func setupTableView()
    func loadingReservation(_ loading: Bool)
}

protocol ProductDetailsRouterProtocol: class {
    var view: ProductDetailsViewProtocol? { get set }
    static func createProductDetailModule(with product: Product) -> UIViewController
    func showSuccessReservationMessage()
    func showErrorMessage(_ message: String)
}

protocol ProductDetailsInteractorInputProtocol: class {
    var presenter: ProductDetailsInteractorOutputProtocol? { get set }
    func makeReservation(with product: Product)
}

protocol ProductDetailsInteractorOutputProtocol: class {
    func didMakeReservation()
    func onError(with message: String)
}

protocol ProductDetailsPresenterProtocol: class {
    var view: ProductDetailsViewProtocol? { get set }
    var interactor: ProductDetailsInteractorInputProtocol? { get set }
    var router: ProductDetailsRouterProtocol? { get set }
    
    func viewDidLoad()
    func reservationButtonTouched(with product: Product)
}

