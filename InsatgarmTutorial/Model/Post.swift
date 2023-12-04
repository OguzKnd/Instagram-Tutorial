//
//  Post.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 1.12.2023.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?

}

extension Post {
    static var MOCK_POSTS : [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "IOS Developer", likes: 355, imageUrl: "oguz", timestamp: Timestamp(), user: User.MOCK_USER[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Prenses", likes: 267, imageUrl: "cindy", timestamp: Timestamp(), user: User.MOCK_USER[1])
    ]
}
