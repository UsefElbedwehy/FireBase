//
//  SignInView.swift
//  LoginPractice2025
//
//  Created by Usef on 25/04/2025.
//

import SwiftUI

struct SignInView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    @EnvironmentObject var viewModel:AppViewModel
    var body: some View {
        VStack {
            Spacer().frame(height: 50)
            Image("logo")
                .resizable()
                .frame(width: 150, height: 150)
            TextField("email", text: $email)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .padding()
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            SecureField("password", text: $password)
                .padding()
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
                .padding(.bottom)
            Button {
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                viewModel.signIn(email: email, password: password)
                print("Sign in button pressed")
            } label: {
                Text("Sign in")
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal,100)
                    .padding(.vertical,15)
                    .background(Color(red: 20/255, green: 255/255, blue: 255/255))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            }
            NavigationLink("Create account") {
                SignUpView()
            }
            
            Spacer()
        }
        .navigationTitle("Sign in")
    }
}

#Preview {
    SignInView()
}
