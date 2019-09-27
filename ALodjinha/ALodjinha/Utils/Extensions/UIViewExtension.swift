//
//  UIViewExtension.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 26/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addLightBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
