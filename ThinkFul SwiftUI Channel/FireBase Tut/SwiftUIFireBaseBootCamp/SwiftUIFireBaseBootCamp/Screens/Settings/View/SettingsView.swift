//
//  SettingsView.swift
//  SwiftUIFireBaseBootCamp
//
//  Created by Usef on 26/04/2025.
//

import SwiftUI

struct SettingsView: View {
    @State private var viewModel = SettingsViewModel()
    @Binding var showSignView: Bool
    var body: some View {
        List {
            signOutSection
            if viewModel.authProviders.contains(.email){
                settingSection
            }
        }
        .navigationTitle("Settings")
        .onAppear {
            viewModel.loadAuthProviders()
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignView: .constant(false))
    }
}

extension SettingsView {
    private var settingSection: some View {
        Section(header: Text("Email Settings")) {
            Button("Reset Password") {
                Task {
                    do{
                        try await viewModel.resetPassword()
                        print("Reset Password...")
                    }catch let error as NSError{
                        print(error)
                    }
                }
            }
            Button("Update Password") {
                Task {
                    do{
                        try await viewModel.updatePassword()
                        print("Update Password...")
                    }catch let error as NSError{
                        print(error)
                    }
                }
            }
            Button("Update Email") {
                Task {
                    do{
                        try await viewModel.updateEmail()
                        print("Update Email...")
                    }catch let error as NSError{
                        print(error)
                    }
                }
            }
        }
    }
}

extension SettingsView {
    private var signOutSection: some View {
        Section("log out") {
            Button("Log Out") {
                viewModel.logOut()
                showSignView = true
            }
        }
    }
}
