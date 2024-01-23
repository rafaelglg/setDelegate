//
//  AnimationManager.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 19/1/24.
//

import UIKit

class AnimationManager {
    
    static func animateCellSelection(_ cell: UITableViewCell) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, animations: {
                cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }, completion: { _ in
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6, options: [.allowUserInteraction], animations: {
                    cell.transform = .identity
                }, completion: nil)
            })
        }
    }
    
    static func animateCellWhenEnded(_ cell: UITableViewCell) {
        UIView.animate(withDuration: 0.2) {
            cell.transform = .identity
        }
    }
    
    static func animateText(Label label: UILabel) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveEaseIn, animations: {
                label.alpha = 1.0
            }, completion: nil)
        }
    }
    
    static func animateImageBorderColor( Image imageView: UIImageView) {
        DispatchQueue.main.async {
            let borderColorAnimation = CABasicAnimation(keyPath: "borderColor")
            borderColorAnimation.fromValue = UIColor.clear.cgColor
            borderColorAnimation.toValue = UIColor.white.cgColor
            borderColorAnimation.duration = 2.0
            
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.add(borderColorAnimation, forKey: "borderColorAnimation")
        }
    }
}
