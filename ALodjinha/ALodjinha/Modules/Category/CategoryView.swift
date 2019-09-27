//
//  CategoryView.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit

class CategoryView: UIViewController {
    var presenter: CategoryPresenterProtocol?
    var category: ProductCategory?
    var loading: UIActivityIndicatorView?
    let footerHeight: CGFloat = 50

    @IBOutlet weak var viewBelowSafeArea: UIView!
    @IBOutlet weak var tableView: UITableView!
    var dataSource: ProductTableDataSource = ProductTableDataSource()
    var homeSections: [HomeSection] = [.product]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
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
    
    func setupView() {
        self.viewBelowSafeArea.addLightBlur()
        self.title = "Category"
    }
    
    func setupTableView() {
        self.tableView.dataSource = self.dataSource
        self.dataSource.homeSections = homeSections
        self.tableView.delegate = self
        self.tableView.register(ProductTableViewCell.self)
    }
}

extension CategoryView: CategoryViewProtocol {
    func showProducts(_ products: Products) {
        self.dataSource.products.append(contentsOf: products)
    }
    
    func setLoading(_ loading: Bool) {
        if loading {
            self.startLoading()
        }
        else {
            self.tableView.reloadData()
            self.stopLoading()
        }
    }
}

extension CategoryView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeSection = homeSections[indexPath.section]
        if homeSection == .product {
            let product = self.dataSource.products[indexPath.row]
            self.presenter?.didClickOnProduct(product)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.dataSource.products.count - 1
        if indexPath.row == lastElement {
            self.presenter?.willDisplayLastRow()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: footerHeight))
        let loading = UIActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: footerHeight))
        loading.style = .white
        loading.color = .primaryColor
        loading.startAnimating()
        view.addSubview(loading)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return footerHeight
    }
}
