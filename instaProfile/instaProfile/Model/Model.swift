//
//  Model.swift
//  instaProfile
//
//  Created by mac on 19.08.2021.
//

import Foundation

struct User {
    let id = UUID().uuidString
    var name: String = ""
    var avatar: String?
    var subscribes: Int
    var followers: Int
    var publications: [String]?
}
