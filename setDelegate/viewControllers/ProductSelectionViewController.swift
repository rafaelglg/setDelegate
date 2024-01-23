//
//  productSelectionViewController.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 15/12/23.
//

import UIKit

protocol ProductSelectionDelegate {
    func didSelectProduct(name: String, imageName: String)
}

class ProductSelectionViewController: UIViewController {
    
    @IBOutlet weak var iphoneButton: UIButton!
    @IBOutlet weak var ipadButton: UIButton!
    @IBOutlet weak var macbookButton: UIButton!
    
    var delegate: ProductSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func ipadBtnDidTapped(_ sender: UIButton) {
        delegate?.didSelectProduct(name: "iPad", imageName: "ipad")
        self.dismiss(animated: true)
    }
    
    @IBAction func iphoneBtnDidTapped(_ sender: UIButton) {
        delegate?.didSelectProduct(name: "📱 iPhone", imageName: "iphone")
        self.dismiss(animated: true)
    }
    
    @IBAction func macbookBtnDidTapped(_ sender: UIButton) {
        delegate?.didSelectProduct(name: "💻 Macbook Pro", imageName: "mac")
        self.dismiss(animated: true)
        
    }
    
    func updateUI() {
        
        iphoneButton.configuration?.title = " iPhone"
        iphoneButton.configuration?.image = UIImage(systemName: "iphone")
        iphoneButton.configuration?.baseBackgroundColor = .systemBlue.withAlphaComponent(0.2)
        iphoneButton.configuration?.baseForegroundColor = .systemBlue
        
        ipadButton.configuration?.title = " iPad"
        ipadButton.configuration?.image = UIImage(systemName: "ipad")
        ipadButton.configuration?.baseBackgroundColor = .systemTeal.withAlphaComponent(0.2)
        ipadButton.configuration?.baseForegroundColor = .systemTeal
        
        macbookButton.configuration?.title = " Macbook Pro"
        macbookButton.configuration?.image = UIImage(systemName: "laptopcomputer")
        macbookButton.configuration?.baseBackgroundColor = .systemIndigo.withAlphaComponent(0.2)
        macbookButton.configuration?.baseForegroundColor = .systemIndigo
        
    }
    
}
