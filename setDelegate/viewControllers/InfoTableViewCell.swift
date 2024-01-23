//
//  InfoTableViewCell.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 17/1/24.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var infoTextCell: UILabel!
    @IBOutlet weak var infoImageView: UIImageView!
    
    static let identifier = "InfoTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "InfoTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateUICell()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateUICell()
        }
    }
    
    func updateUICell(){
        
        cellView.layer.cornerRadius = 10
        cellView.layer.masksToBounds = false
        
        switch traitCollection.userInterfaceStyle{
            
        case .light:
            cellView.layer.shadowColor = UIColor(red: 0.403, green: 0.394, blue: 0.867, alpha: 0.2).cgColor
            cellView.layer.shadowRadius = 10
            cellView.layer.shadowOpacity = 0.7
            cellView.layer.shadowOffset = CGSize(width: 1, height: 5)
            
        case .dark :
            cellView.layer.borderColor = UIColor.white.cgColor
            cellView.layer.borderWidth = 1
            
        default: 
            break
        }
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ user: ProfileInfoManager){
        infoTextCell.text = user.Title
        infoImageView.image = UIImage(named: user.img)
    }
}
