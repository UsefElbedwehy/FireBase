//
//  AuthViewModel.swift
//  SwiftUIFireBaseBootCamp
//
//  Created by Usef on 26/04/2025.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

class AuthViewModel : ObservableObject {
    
    func signInWithGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthManager.shared.signInWithGoogle(tokens: tokens)
    }
    
}
