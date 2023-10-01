//
//  AuthService.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/30/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
   
}
