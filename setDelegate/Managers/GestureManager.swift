//
//  GestureManager.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 19/1/24.
//

import UIKit

class GestureManager {
    
    static func addLongPressGesture(to tableView: UITableView, target: Any, action: Selector) {
        let longPress = UILongPressGestureRecognizer(target: target, action: action)
        tableView.addGestureRecognizer(longPress)
        tableView.reloadData()
    }
    
    static func addTapGesture(to view: UIView, target: Any, action: Selector) -> UITapGestureRecognizer {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        return tapGesture
    }
}
