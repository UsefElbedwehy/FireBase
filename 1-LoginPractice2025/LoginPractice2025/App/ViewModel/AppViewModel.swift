//
//  AppViewModel.swift
//  LoginPractice2025
//
//  Created by Usef on 25/04/2025.
//

import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    @Published var signedIn:Bool = false
    var isSignedIn:Bool {
        return auth.currentUser != nil
    }
    func signIn(email:String, password:String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print("Error signing in: \(error!.localizedDescription)")
                return
            }
            print("Signed in successfully")
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    func signUp(email:String, password:String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print("Error creating user: \(error!.localizedDescription)")
                return
            }
            print("Signed up successfully")
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func logout() {
        do {
            try auth.signOut()
            signedIn = false
        }catch {
            print("Falied to logout: \(error.localizedDescription)")
        }
    }
    
}
