//
//  User.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var email: String
    
    var isCurrentUser: Bool {
        guard let currentUID = Auth.auth().currentUser?.uid else { return false }
        return currentUID == id
    }
    
}



extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "colstin", email: "colstin50@gmail.com")
       
    ]
}
