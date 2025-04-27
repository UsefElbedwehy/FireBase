//
//  ContentView.swift
//  LoginPractice2025
//
//  Created by Usef on 24/04/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel:AppViewModel
    var body: some View {
        NavigationStack {
            if viewModel.signedIn {
                Button {
                    viewModel.logout()
                } label: {
                    Text("Logout")
                        .foregroundStyle(.red)
                }

                Text("You are actually signed in")
            }else {
                SignInView()
            }
        }.onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

#Preview {
    ContentView()
}



