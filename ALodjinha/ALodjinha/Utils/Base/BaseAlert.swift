//
//  BaseAlert.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

class BaseAlert {
    class func message(_ controller: UIViewController, message: String, onComplete: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.tintColor = .primaryColor
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: { alert in
            onComplete()
        })
        alert.addAction(defaultAction)
        controller.present(alert, animated: false, completion: nil)
    }
    
    class func error(_ controller: UIViewController, message: String, onComplete: @escaping () -> Void) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.view.tintColor = .primaryColor
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: { alert in
            onComplete()
        })
        alert.addAction(defaultAction)
        controller.present(alert, animated: false, completion: nil)
    }
}
