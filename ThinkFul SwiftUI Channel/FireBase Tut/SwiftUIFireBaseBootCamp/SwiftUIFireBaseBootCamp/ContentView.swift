//
//  ContentView.swift
//  SwiftUIFireBaseBootCamp
//
//  Created by Usef on 26/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showSignInView:Bool = false
    var body: some View {
        ZStack {
            if !showSignInView {
                NavigationStack {
                    SettingsView(showSignView: $showSignInView)
                }
            }
        }.onAppear {
            let authUser = try? AuthManager.shared.getAuthenticatedUser()
            self.showSignInView = (authUser == nil)
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                AuthenticationView(showSignInView: $showSignInView)
            }
        }
    }
}

#Preview {
    ContentView()
}
