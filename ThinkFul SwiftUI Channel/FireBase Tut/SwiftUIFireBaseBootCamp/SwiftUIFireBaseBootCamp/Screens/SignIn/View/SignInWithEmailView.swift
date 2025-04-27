//
//  SignInWithEmailView.swift
//  SwiftUIFireBaseBootCamp
//
//  Created by Usef on 26/04/2025.
//

import SwiftUI

struct SignInWithEmailView: View {
    @StateObject private var viewModel = SignInWithEmailViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        VStack {
            TextField(text: $viewModel.email) {
                Text("Email...")
            }
            .padding()
            .background(.gray.opacity(0.165))
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            .padding(.horizontal)
            .padding(.vertical,10)
            
            SecureField(text: $viewModel.password) {
                Text("Password...")
            }
            .padding()
            .background(.gray.opacity(0.165))
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            .padding(.horizontal)
            Button {
                print("SignIn Button Pressed")
                Task {
                    do{
                        let isSuccess = try await viewModel.signUp()
                        if isSuccess {
                            showSignInView = false
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                    do{
                         let isSuccess = try await viewModel.signIn()
                        if isSuccess {
                            showSignInView = false
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Sign In")
                    .padding(.vertical,15)
                    .padding(.horizontal,120)
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                    .padding(.vertical,10)
            }
            Spacer()
        }
        .navigationTitle("Sign In With Email")
    }
}

#Preview {
    SignInWithEmailView(showSignInView: .constant(true))
}
