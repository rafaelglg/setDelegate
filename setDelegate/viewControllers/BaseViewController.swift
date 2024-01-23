//
//  BaseViewController.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 15/12/23.
//

import UIKit

struct ProductInfo {
    let name: String
    let imageName: String
    let displayText: String
}

class BaseViewController: UIViewController {
    
    var tabBarCv: CustomTabBarController?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var bottomBtn: UIButton!
    @IBOutlet weak var mainText: UILabel!
    
    let productsInfo: [ProductInfo] = [
        ProductInfo(name: "iphone", imageName: "iphone", displayText: "📱 iPhone"),
        ProductInfo(name: "ipad", imageName: "ipad", displayText: "iPad"),
        ProductInfo(name: "mac", imageName: "mac", displayText: "💻 Macbook Pro"),
        ProductInfo(name: "all-products", imageName: "all-products", displayText: "Apple Product Line")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        tabBarController?.delegate = self
        
    }
    
    func didFirstTabBarItemSelected(image: UIImage?, labelText: String?) {
        if let tabBarCv = self.tabBarController {
            if let tabItems = tabBarCv.tabBar.items {
                if tabItems.indices.contains(0) {
                    productImage.image = image
                    mainText.text = labelText
                }
            }
        }
    }
    
    @IBAction func handleBottomButtonTap(_ sender: UIButton) {
        
        guard let productSelectionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductSelectionVC") as? ProductSelectionViewController else {return}
        
        productSelectionVC.delegate = self
        productSelectionVC.modalPresentationStyle = .pageSheet
        productSelectionVC.sheetPresentationController?.detents = [.medium()]
        productSelectionVC.sheetPresentationController?.prefersGrabberVisible = true
        self.present(productSelectionVC , animated: true)
    }
    
    func updateUI(){
        
        let titleBtn = " Accede a productos"
        
        bottomBtn.setTitle(titleBtn, for: .normal)
        mainText.text = "Apple Product Line"
        productImage.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleProfileImageTapped))
        tapGesture.numberOfTapsRequired = 1
        productImage.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleProfileImageTapped(_ gesture: UITapGestureRecognizer) {
        
        if gesture.view is UIImageView {
            
            let randomProductInfo = productsInfo.randomElement()
            productImage.image = UIImage(named: randomProductInfo?.imageName ?? "")
            mainText.text = randomProductInfo?.displayText ?? ""
            
        }
    }
}

extension BaseViewController: ProductSelectionDelegate {
    func didSelectProduct(name: String, imageName: String) {
        mainText.text = name
        productImage.image = UIImage(named: imageName)
    }
}

extension BaseViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let selectedTabIndex = tabBarController.viewControllers?.firstIndex(of: viewController) {
            if selectedTabIndex == 0 {
                didFirstTabBarItemSelected(image: UIImage(named: "all-products"), labelText: "Apple Product Line")
            }
        }
    }
}

