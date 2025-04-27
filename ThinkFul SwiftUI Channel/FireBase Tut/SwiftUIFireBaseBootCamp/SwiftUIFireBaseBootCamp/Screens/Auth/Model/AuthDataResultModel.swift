//
//  AuthDataResultModel.swift
//  SwiftUIFireBaseBootCamp
//
//  Created by Usef on 26/04/2025.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user:User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

struct GoogleSignInResultModel {
    let idToken: String
    let accessToken: String
    let name:String?
    let email:String?
    let imgUrl:String?
}
