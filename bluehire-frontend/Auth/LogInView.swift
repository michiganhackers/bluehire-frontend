//
//  LogInView.swift
//  bluehire-frontend
//
//  Created by Danish Imran on 2/5/25.
//

import SwiftUI
import GoogleSignIn
import KeychainSwift

struct LogInView: View {
    @EnvironmentObject var LoginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Log In Screen")
            Button(action: {handleGoogleSignInButton()}, label: {
                Text("Sign In With Google")
            })
        }
    }
    
    func handleGoogleSignInButton() {
        if let rootViewController = getRootViewController() {
            GIDSignIn.sharedInstance.signIn(
                withPresenting: rootViewController
            ) {result, error in
                guard let result else {
                    // inspect error
                    print("Google Sign-In failed: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                let token = result.user.idToken?.tokenString ?? ""
                LoginViewModel.login(with: token)
            }
        }
    }
}


func getRootViewController() -> UIViewController? {
    guard let scene = UIApplication.shared.connectedScenes.first as?
            UIWindowScene,
          let rootViewController = scene.windows.first?.rootViewController else {
        return nil
    }
    return getVisibleViewController(from: rootViewController)
}

private func getVisibleViewController(from vc: UIViewController) -> UIViewController {
     if let nav = vc as? UINavigationController {
         return getVisibleViewController(from: nav.visibleViewController!)
     }
     if let tab = vc as? UITabBarController {
         return getVisibleViewController(from: tab.selectedViewController!)
     }
     if let presented = vc.presentedViewController {
         return getVisibleViewController(from: presented)
     }
     return vc
}


#Preview {
    LogInView()
}
