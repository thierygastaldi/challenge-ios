//
//  UIViewExtension.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView: class {}
extension ReusableView where Self: UIView {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: class {}
extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle.main)
    }
    
    static func loadFromBundle() -> Self? {
        guard let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)?[0] as? Self else {
            return nil
        }
        
        return view
    }
}
