//
//  DataManager.swift
//  instaProfile
//
//  Created by mac on 20.08.2021.
//

import Foundation

class DataManager {

    private var users: [User]?
    private static var obj: DataManager?
    
    private init() {}
    private init(_ users: User...) {
        self.users = users
    }
    
    static func instance() -> DataManager {
        if let object = Self.obj {
            return object
        }
        let object = DataManager(User(name: "Phoebe", avatar: "bay", subscribes: Int.random(in: 100..<250), followers: Int.random(in: 600..<800), publications: ["tram", "bay", "boat", "littlePrince", "chapel", "bay", "tram", "littlePrince", "boat", "chapel"]),
                               User(name: "Joan", avatar: "littlePrince", subscribes: Int.random(in: 1..<100), followers: Int.random(in: 1..<50), publications: ["chapel", "bay", "littlePrince", "tram", "boat"]),
                               User(name: "Miley", avatar: "boat", subscribes: Int.random(in: 150..<200), followers: Int.random(in: 150..<200), publications: ["littlePrince", "chapel", "bay", "tram"]))
        Self.obj = object
        return object
    }
    
    public func getUsersArray() -> [User]? {
        return users
    }
    
    public func getUser(index: Int, completion: (() -> Void)?) -> User? {
        guard let users = users, index < users.count else {
            return nil
        }
        completion?()
        return users[index]
    }
    
    public func getUser(userId: String, completion: (() -> Void)?) -> User? {
        if let _ = UUID.init(uuidString: userId), let users = users {
            for i in 0 ... users.count {
                if users[i].id == userId {
                    completion?()
                    return users[i]
                }
            }
            
        }
        return nil
    }
    
    public func getUserPhotoTitles(userId: String, completion: (() -> Void)?) -> [String]? {
        if let user = getUser(userId: userId, completion: nil), let publications = user.publications {
            completion?()
            return publications
        }
        return nil
    }
    
    public func append(user: User) {
        users?.append(user)
    }
    
    public func delete(userId: String) -> User? {
        if let index = findIndex(userId: userId) {
            return users?.remove(at: index)
        }
        return nil
    }
    
    public func findIndex(userId: String) -> Int? {
        if let _ = UUID.init(uuidString: userId), let users = users {
            for index in 0 ... users.count {
                if users[index].id == userId {
                    return index
                }
            }
            
        }
        return nil
    }
}

var UsersDataBase = DataManager.instance()


