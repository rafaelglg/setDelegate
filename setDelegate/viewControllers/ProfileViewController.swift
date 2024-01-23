//
//  ProfileViewController.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 14/1/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var infoContainer: UIView!
    @IBOutlet weak var profileImgContainer: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(InfoTableViewCell.nib(), forCellReuseIdentifier: InfoTableViewCell.identifier)
        
        updateUI()
        actionHandler()
    }
    
    @IBAction func didTapSort(_ sender: UIBarButtonItem) {
        
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    func actionHandler(){
        
        GestureManager.addLongPressGesture(to: tableView, target: self, action: #selector(handleLongPress(sender:)))
        
        tapGesture = GestureManager.addTapGesture(to: view, target: self, action: #selector(handleTap))
    }
    
    @objc private func handleTap() {
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
        }
    }
    
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let touchPoint = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint),
               let cell = tableView.cellForRow(at: indexPath) {
                
                AnimationManager.animateCellSelection(cell)
                HapticsManager.shared.vibrate(for: .success)
            }
        } else if sender.state == .ended {
            if let indexPath = tableView.indexPathForRow(at: .zero) {
                if let cell = tableView.cellForRow(at: indexPath) {
                    AnimationManager.animateCellWhenEnded(cell)
                }
            }
        }
    }
    
    func updateUI(){
        profileImage.image = UIImage(named: "profile")
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 3
        AnimationManager.animateImageBorderColor(Image: profileImage)
        
        profileImgContainer.layer.shadowColor = UIColor.black.cgColor
        profileImgContainer.layer.shadowOpacity = 0.5
        profileImgContainer.layer.shadowRadius = 5
        profileImgContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        nameLabel.text = "Rafael Loggiodice"
        professionLabel.text = "iOS Developer"
        professionLabel.textColor = .systemGray
        professionLabel.font = .systemFont(ofSize: 17, weight: .light)
        professionLabel.alpha = 0.0
        AnimationManager.animateText(Label: professionLabel)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileInfoManager.getList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as? InfoTableViewCell else {
            return UITableViewCell()
        }
        
        let data = ProfileInfoManager.getList()[indexPath.row]
        cell.setData(data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? InfoTableViewCell,
              let labelText = cell.infoTextCell.text else {return}
        
        if let url = URLProvider.urlForLabel(labelText) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            let vc = PDFViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        var list = ProfileInfoManager.getList()
        list.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
}
