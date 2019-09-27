//
//  BaseViewController.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var _reloadViewContainer : UIView? = nil
    private var _reloadButton : UIButton? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showReloadView() {
        if (self._reloadViewContainer != nil) { self.hideReloadView() }
        self._reloadViewContainer = UIView(frame: UIScreen.main.bounds)
        self._reloadViewContainer!.backgroundColor = .white
        self._reloadButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 50))
        self._reloadButton?.addTarget(self, action: #selector(self.reloadButtonTouched), for: .touchUpInside)
        self._reloadButton!.setTitle("Recarregar", for: .normal)
        self._reloadButton!.setTitleColor(.white, for: .normal)
        self._reloadButton!.layer.cornerRadius = 8
        self._reloadButton!.backgroundColor = .primaryColor
        self._reloadViewContainer!.addSubview(self._reloadButton!)
        self._reloadButton!.center = CGPoint(x: UIScreen.main.bounds.width/2.0, y: UIScreen.main.bounds.height/2.0)
        self.view.addSubview(self._reloadViewContainer!)
    }
    
    func hideReloadView() {
        if (self._reloadViewContainer != nil) {
            self._reloadButton!.removeFromSuperview()
            self._reloadButton = nil
            self._reloadViewContainer!.removeFromSuperview()
            self._reloadViewContainer = nil
        }
    }
    
    @objc func reloadButtonTouched(){
        
    }
}
