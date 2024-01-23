//
//  CustomTabBarController.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 31/12/23.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    @IBInspectable var initialIndex : Int = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        selectedIndex = initialIndex
        
    }
}

