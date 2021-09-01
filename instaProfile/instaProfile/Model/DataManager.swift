//
//  DataManager.swift
//  instaProfile
//
//  Created by mac on 20.08.2021.
//

import Foundation

class DataManager {

    private var users: [User] = []
    
    init(_ users: User...) {
        users.forEach({ user in
            self.users.append(user)
        })
    }
    
    func append(user: User) {
        users.append(user)
    }
    
    func delete(userId: String) -> User? {
        if let index = findIndex(userId: userId) {
            return users.remove(at: index)
        }
        return nil
    }
    
    func findIndex(userId: String) -> Int? {
        if let _ = UUID.init(uuidString: userId)/*, let users = users*/ {
            for index in 0 ... users.count {
                if users[index].id == userId {
                    return index
                }
            }
            
        }
        return nil
    }
    
    func getUsersArray() -> [User]? {
        return users
    }
    
    func getUser(userId: String, completion: (() -> Void)?) -> User? {
        if let _ = UUID.init(uuidString: userId) /*, let users = users*/ {
            for i in 0 ... users.count {
                if users[i].id == userId {
                    completion?()
                    return users[i]
                }
            }
            
        }
        return nil
    }
    
    func getUserPhotoTitles(userId: String, completion: (() -> Void)?) -> [String]? {
        if let user = getUser(userId: userId, completion: nil), let publications = user.publications {
            completion?()
            return publications
        }
        return nil
    }
}

var UsersDataBase = DataManager(User(name: "Phoebe", avatar: "bay", subscribes: Int.random(in: 100..<250), followers: Int.random(in: 600..<800), publications: ["tram", "bay", "boat", "littlePrince", "chapel", "bay", "tram", "littlePrince", "boat", "chapel"]),
                                User(name: "Joan", avatar: "littlePrince", subscribes: Int.random(in: 1..<100), followers: Int.random(in: 1..<50), publications: ["chapel", "bay", "littlePrince", "tram", "boat"]),
                                User(name: "Miley", avatar: "boat", subscribes: Int.random(in: 150..<200), followers: Int.random(in: 150..<200), publications: ["littlePrince", "chapel", "bay", "tram"]))

