//
//  ProfileInfoModel.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 18/1/24.
//

import Foundation

struct ProfileInfoManager {
    let Title: String
    let img: String
    
    static func getList() -> [ProfileInfoManager] {
        let list = [
            ProfileInfoManager(Title: "Github", img: "github"),
            ProfileInfoManager(Title: "Linkedin", img: "linkedin"),
            ProfileInfoManager(Title: "CV", img: "cv")
        ]
        return (list)
    }
}
