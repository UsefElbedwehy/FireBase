//
//  SignInGoogleHelper.swift
//  SwiftUIFireBaseBootCamp
//
//  Created by Usef on 27/04/2025.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

final class SignInGoogleHelper {

    @MainActor
    func signIn() async throws -> GoogleSignInResultModel {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(
            withPresenting: topVC
        )
        guard let idToken: String = gidSignInResult.user.idToken?.tokenString
        else {
            throw URLError(.clientCertificateRequired)
        }
        let accessToken: String = gidSignInResult.user.accessToken.tokenString

        let name: String = gidSignInResult.user.profile?.name ?? ""
        let email: String = gidSignInResult.user.profile?.email  ?? ""
        let imgUrl: String = gidSignInResult.user.profile?.imageURL(withDimension: 50)?.absoluteString  ?? ""

        return GoogleSignInResultModel(
            idToken: idToken,
            accessToken: accessToken,
            name: name,
            email: email,
            imgUrl: imgUrl
        )
    }
}
