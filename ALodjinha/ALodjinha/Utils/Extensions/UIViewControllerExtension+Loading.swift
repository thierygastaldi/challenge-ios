//
//  UIViewControllerExtension+Loading.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    private static var _loadingViewContainer : UIView? = nil
    private static var _loadingIndicatorView : UIActivityIndicatorView? = nil
    
    func startLoading() {
        if (UIViewController._loadingViewContainer != nil) { stopLoading() }
        UIViewController._loadingViewContainer = UIView(frame: UIScreen.main.bounds)
        UIViewController._loadingViewContainer!.backgroundColor = .white
        UIViewController._loadingIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)
        UIViewController._loadingIndicatorView!.color = .primaryColor
        UIViewController._loadingIndicatorView!.startAnimating()
        UIViewController._loadingViewContainer!.addSubview(UIViewController._loadingIndicatorView!)
        UIViewController._loadingIndicatorView!.center = CGPoint(x: self.view.frame.width/2.0, y: self.view.frame.height/2.0)
        self.view.addSubview(UIViewController._loadingViewContainer!)
        
        UIViewController._loadingViewContainer!.alpha = 0
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .transitionCrossDissolve,
            animations: {
                UIViewController._loadingViewContainer!.alpha = 1
        },
            completion: nil)
    }
    
    func stopLoading() {
        if (UIViewController._loadingViewContainer != nil) {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .transitionCrossDissolve, animations: {
                UIViewController._loadingViewContainer!.alpha = 0
            }) { (completion) in
                UIViewController._loadingIndicatorView!.removeFromSuperview()
                UIViewController._loadingIndicatorView = nil
                UIViewController._loadingViewContainer!.removeFromSuperview()
                UIViewController._loadingViewContainer = nil
            }
        }
    }
}
