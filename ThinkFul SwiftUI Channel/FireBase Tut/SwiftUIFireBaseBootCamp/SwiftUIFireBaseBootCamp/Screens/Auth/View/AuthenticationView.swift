//
//  AuthenticationView.swift
//  SwiftUIFireBaseBootCamp
//
//  Created by Usef on 26/04/2025.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AuthenticationView: View {
    @StateObject private var viewModel = AuthViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    SignInWithEmailView(showSignInView: $showSignInView)
                } label: {
                    Text("Sign In With Email")
                        .foregroundStyle(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,80)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                }
                GoogleSignInButton(scheme: .light, style: .wide, state: .normal) {
                    Task {
                        do {
                            try await viewModel.signInWithGoogle()
                            showSignInView = false
                        }catch {
                            print(error)
                        }
                    }
                }.padding()
            }
            .navigationTitle("Sign In")
        }
    }
}

#Preview {
    AuthenticationView(showSignInView: .constant(true))
}
