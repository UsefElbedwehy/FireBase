//
//  LoginPractice2025App.swift
//  LoginPractice2025
//
//  Created by Usef on 24/04/2025.
//

import SwiftUI
import Firebase

@main
struct LoginPractice2025App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegete 
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate : NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
