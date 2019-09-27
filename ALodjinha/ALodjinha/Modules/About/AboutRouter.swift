//
//  AboutRouter.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

class AboutRouter {
    static func createAboutModule() -> UIViewController {
        if let view = storyboard.instantiateViewController(withIdentifier: "AboutView") as? AboutView {
            view.title = "Sobre"
            return view
        }
        
        return UIViewController()
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "About", bundle: Bundle.main)
    }
}
