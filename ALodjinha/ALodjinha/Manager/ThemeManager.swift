//
//  ThemeManager.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import UIKit

class ThemeManager {
    static func setupLayout() {
        // Navigation Bar Customization
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .primaryColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}
