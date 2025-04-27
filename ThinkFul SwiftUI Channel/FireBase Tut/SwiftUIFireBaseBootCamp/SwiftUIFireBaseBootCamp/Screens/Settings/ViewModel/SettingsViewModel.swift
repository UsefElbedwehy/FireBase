//
//  SettingsViewModel.swift
//  SwiftUIFireBaseBootCamp
//
//  Created by Usef on 26/04/2025.
//

import Foundation


@MainActor
final class SettingsViewModel: ObservableObject {
    @Published var authProviders: [AuthProviderOptions] = []
    
    func loadAuthProviders() {
        do {
            authProviders = try AuthManager.shared.getProvider()
        }catch {
            print(error)
        }
    }
    
    func logOut() {
        AuthManager.shared.signOut()
    }
    func resetPassword() async throws {
        let authUser = try AuthManager.shared.getAuthenticatedUser()
        guard let email = authUser.email else {
           throw URLError(.fileDoesNotExist)
        }
        try await AuthManager.shared.resetPassword(email: email)
    }
    func updatePassword() async throws {
        let newPassword:String = "Usef3000@"
        let authUser = try AuthManager.shared.getAuthenticatedUser()
        guard authUser.email != nil else {
           throw URLError(.fileDoesNotExist)
        }
        try await AuthManager.shared.updatePassword(password: newPassword)
    }
    func updateEmail() async throws {
        let newEmail:String = "youssef.m.elbedwehy@gmail.com"
        let authUser = try AuthManager.shared.getAuthenticatedUser()
        guard authUser.email != nil else {
           throw URLError(.fileDoesNotExist)
        }
        try await AuthManager.shared.updateEmail(email: newEmail)
    }
}
