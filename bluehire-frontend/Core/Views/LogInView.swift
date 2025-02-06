//
//  LogInView.swift
//  bluehire-frontend
//
//  Created by Danish Imran on 2/5/25.
//

import SwiftUI
import GoogleSignIn

struct LogInView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Log In Screen")
            Button(action: {handleSignInButton()}, label: {
                Text("Sign In With Google")
            })
        }
    }
    
    func handleSignInButton() {
        print("Sign in with Google selected")
        
        if let rootViewController = getRootViewController() {
            GIDSignIn.sharedInstance.signIn(
                withPresenting: rootViewController
            ) {result, error in
                guard let result else {
                    // inspect error
                    return
                }
                // self.user = User.init(name: result.user.profile?.name ?? "")
                userViewModel.login(username: result.user.profile?.name ?? "")
                
                print(result.user.profile?.name)
                print(result.user.profile?.email)
                print(result.user.profile?.imageURL(withDimension: 200))
            }
        }
    }
}

// #Preview {
//     LogInView()
// }

//
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

