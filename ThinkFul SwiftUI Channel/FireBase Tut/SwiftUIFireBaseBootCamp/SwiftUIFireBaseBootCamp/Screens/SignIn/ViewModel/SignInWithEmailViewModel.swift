//
//  SignInWithEmailViewModel.swift
//  SwiftUIFireBaseBootCamp
//
//  Created by Usef on 26/04/2025.
//

import Foundation

@MainActor
final class SignInWithEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() async throws -> Bool {
        guard !email.isEmpty, !password.isEmpty else {
            print("Empty email or password")
            return false
        }
        _ = try await AuthManager.shared.signIn(
            email: email,
            password: password
        )
        return true
    }
    func signUp() async throws -> Bool {
        guard !email.isEmpty, !password.isEmpty else {
            print("Empty email or password")
            return false
        }
        _ = try await AuthManager.shared.signUp(
            email: email,
            password: password
        )
        return true
    }
}
