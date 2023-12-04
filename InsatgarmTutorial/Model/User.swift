//
//  User.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 30.11.2023.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname:String?
    var bio:String?
    let email:String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
    
}

extension User {
    static var MOCK_USER: [User] = [
    
        .init(id: NSUUID().uuidString, username: "oguzknd", profileImageUrl: nil, fullname: "Oguz Kanda", bio: "Marmara UNI", email: "oguzkanda@gmail.com"),
        .init(id: NSUUID().uuidString, username: "hazalknd", profileImageUrl: nil, fullname: "Hazal Kanda", bio: "Cindy <3", email: "hazalkanda@gmail.com"),
        .init(id: NSUUID().uuidString, username: "egehanknd", profileImageUrl: nil, fullname: "Egehan Kanda", bio: "ITU", email: "egehankanda@gmail.com"),
        .init(id: NSUUID().uuidString, username: "kadircandede", profileImageUrl: nil, fullname: "Kadir Can Dede", bio: "Çankırı Merkez", email: "kadircandede@gmail.com")
        
    ]
}
