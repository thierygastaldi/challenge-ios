//
//  HomeView.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit

enum HomeSection: Int {
    case banner, category, product
}

class HomeView: BaseViewController {

    @IBOutlet weak var navTitleLabel: UILabel!
    @IBOutlet var headerNavView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    var presenter: HomePresenterProtocol?
    var dataSource: ProductTableDataSource = ProductTableDataSource()
    var homeSections: [HomeSection] = [.banner, .category, .product]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.presenter?.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.presenter?.viewWillDisappear()
    }
    
    override func reloadButtonTouched() {
        self.presenter?.reloadButtonTouched()
    }
    
    @objc private func refreshControlValueChanged(_ sender: Any) {
        self.refreshControl.endRefreshing()
        self.presenter?.refreshControlValueChanged()
    }
    
    func addRefreshControl() {
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = self.refreshControl
        } else {
            self.tableView.addSubview(self.refreshControl)
        }
        self.refreshControl.tintColor = .white
        self.refreshControl.addTarget(self, action: #selector(refreshControlValueChanged(_:)), for: .valueChanged)
    }
    
    func setupView() {
        self.navTitleLabel.font = UIFont.pacificFontWith(size: 18)
    }
    
    func setupTableView() {
        self.view.backgroundColor = .primaryColor
        self.tableView.backgroundColor = .primaryColor
        self.tableView.dataSource = self.dataSource
        self.dataSource.homeSections = homeSections
        self.dataSource.categoryCollectionDelegate = self
        self.tableView.delegate = self
        self.tableView.register(ProductTableViewCell.self)
        self.tableView.register(CategoryTableViewCell.self)
        self.tableView.register(BannerTableViewCell.self)
    }
}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeSection = homeSections[indexPath.section]
        if homeSection == .product {
            let product = self.dataSource.products[indexPath.row]
            self.presenter?.didClickOnProduct(product)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let homeSection = homeSections[section]
        switch homeSection {
        case .banner:
            self.headerNavView.backgroundColor = .primaryColor
            return self.headerNavView
        case .category, .product:
            let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: 50.0))
            view.backgroundColor = .white
            
            let title = UILabel(frame: CGRect(x: 20.0, y: 20.0, width: self.view.frame.width - 30.0, height: 20.0))
            title.font = UIFont.boldSystemFont(ofSize: 18)
            title.text = homeSection == .category ? "Categorias" : "Mais vendidos"
            view.addSubview(title)
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let homeSection = homeSections[section]
        return homeSection == .banner ? self.headerNavView.frame.height : 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: 1.0))
        view.backgroundColor = .white
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
}

extension HomeView: HomeViewProtocol {
    func showProducts(_ products: Products) {
        self.dataSource.products = products
    }
    
    func showCategories(_ categories: Categories) {
        self.dataSource.categories = categories
    }
    
    func showBanners(_ banners: Banners) {
        self.dataSource.banners = banners
    }
    
    func setLoading(_ loading: Bool) {
        if loading {
            self.tableView.isHidden = true
            self.startLoading()
        }
        else {
            self.tableView.isHidden = false
            self.tableView.reloadData()
            self.stopLoading()
        }
    }
    
    func showReloadErrorView() {
        self.showReloadView()
    }
    
    func hideReloadErrorView() {
        self.hideReloadView()
    }
}

extension HomeView: CategoryCollectionDelegate {
    func didClickOnCategory(_ category: ProductCategory) {
        self.presenter?.didClickOnCategory(category)
    }
}


