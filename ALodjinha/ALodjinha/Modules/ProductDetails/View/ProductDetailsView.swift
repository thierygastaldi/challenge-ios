//
//  ProductDetailsView.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit

class ProductDetailsView: UIViewController {
    
    var presenter: ProductDetailsPresenterProtocol?
    var product: Product?
    let dataSource: ProductDetailsDataSource = ProductDetailsDataSource()

    @IBOutlet weak var reservationLoading: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reservationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    func setupView() {
        self.title = product?.category.descriptionText ?? ""
    }
    
    func setupReservationButton() {
        self.reservationButton.backgroundColor = .primaryColor
        self.reservationButton.layer.cornerRadius = 8.0
    }
    
    func setupTableView() {
        self.tableView.register(ProductImageTableViewCell.self)
        self.tableView.register(ProductPriceTableViewCell.self)
        self.tableView.register(ProductDescriptionTableViewCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self.dataSource
        self.dataSource.product = self.product
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func reservationButtonTouched(_ sender: Any) {
        if let product = self.product {
            self.presenter?.reservationButtonTouched(with: product)
        }
    }
}

extension ProductDetailsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // returns the same height from reservation button view
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70))
        view.backgroundColor = .white
        return view
    }
}

extension ProductDetailsView: ProductDetailsViewProtocol {
    func loadingReservation(_ loading: Bool) {
        if loading {
            self.reservationLoading.startAnimating()
            self.reservationLoading.isHidden = false
            self.reservationButton.isUserInteractionEnabled = false
            self.reservationButton.setTitle("", for: .normal)
        }
        else {
            self.reservationLoading.stopAnimating()
            self.reservationLoading.isHidden = true
            self.reservationButton.isUserInteractionEnabled = true
            self.reservationButton.setTitle("Reservar", for: .normal)
        }
    }
}
