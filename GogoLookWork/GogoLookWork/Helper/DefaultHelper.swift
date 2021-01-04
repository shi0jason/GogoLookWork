//
//  DefaultHelper.swift
//  GogoLookWork
//
//  Created by Jason on 2021/1/3.
//  Copyright © 2021 Jason. All rights reserved.
//

import Foundation

class DefaultHelper {
    
    static func setFlag(at id: Int) {
        if let favoriteDict = UserDefaults.standard.dictionary(forKey: "Favorite") {
            var dict = favoriteDict
            if let idValue = dict["\(id)"] as? Bool {
                dict["\(id)"] = idValue == true ? false : true
                UserDefaults.standard.set(dict, forKey: "Favorite")
            } else {
                dict["\(id)"] = true
                UserDefaults.standard.set(dict , forKey: "Favorite")
            }
        } else {
            let dict = ["\(id)": true]
            UserDefaults.standard.set(dict , forKey: "Favorite")
        }
    }
    
    static func getFlag(at id: Int) -> Bool {
        if let favoriteDict = UserDefaults.standard.dictionary(forKey: "Favorite") {
            var dict = favoriteDict
            if let idValue = dict["\(id)"] as? Bool {
                return idValue
            }
        }
        return false
    }
}
