//
//  HapticsManager.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 19/1/24.
//

import UIKit

class HapticsManager {
    static let shared = HapticsManager()
    
    private init (){}
    
    func selectionVibrate() {
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
        selectionFeedbackGenerator.prepare()
        selectionFeedbackGenerator.selectionChanged()
    }
    
    func vibrate (for type: UINotificationFeedbackGenerator.FeedbackType){
        
        let notificationGenerator = UINotificationFeedbackGenerator()
        notificationGenerator.prepare()
        notificationGenerator.notificationOccurred(type)
    }
}
