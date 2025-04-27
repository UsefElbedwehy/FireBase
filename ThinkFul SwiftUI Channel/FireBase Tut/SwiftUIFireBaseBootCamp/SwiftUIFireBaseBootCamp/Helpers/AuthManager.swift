//
//  AuthManager.swift
//  SwiftUIFireBaseBootCamp
//
//  Created by Usef on 26/04/2025.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

enum AuthProviderOptions : String{
    case email = "password"
    case google = "google.com"
}

final class AuthManager {
    static let shared = AuthManager()
    private init() {}
    
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    func getProvider() throws -> [AuthProviderOptions] {
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        var providers: [AuthProviderOptions] = []
        for provider in providerData {
            if let option = AuthProviderOptions(rawValue: provider.providerID) {
                providers.append(option)
            }else{
                assertionFailure("provider options not match")
            }
        }
        return providers
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        }catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
}

// MARK: SignIn Email
extension AuthManager {
    
    @discardableResult
    func signIn(email:String, password:String) async throws -> AuthDataResultModel {
        let authDataRes = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataRes.user)
    }
    
    @discardableResult
    func signUp(email:String, password:String) async throws -> AuthDataResultModel {
        let authDataRes = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataRes.user)
    }
    
    
    func resetPassword(email:String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password:String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.fileDoesNotExist)
        }
        try await user.updatePassword(to: password)
    }
    
    func updateEmail(email:String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.fileDoesNotExist)
        }
        try await user.sendEmailVerification(beforeUpdatingEmail: email)
    }
}

// MARK: SignIn SSO
extension AuthManager {
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signInWith(credential: credential)
    }
    func signInWith(credential: AuthCredential) async throws -> AuthDataResultModel {
        let authDataRes = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataRes.user)
    }
}
