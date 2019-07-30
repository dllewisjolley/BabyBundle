//
//  SignInViewController.swift
//  BabyBundle
//
//  Created by Lambda_School_Loaner_148 on 7/30/19.
//  Copyright © 2019 Lambda_School_Loaner_148. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let signIn = GIDSignIn.sharedInstance()
        
        signIn?.delegate = self
        signIn?.uiDelegate = self
        signIn?.signInSilently()
        

     
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            NSLog("Error signing in with Google: \(error)")
            return
        }
        
        guard let authentification = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentification.idToken, accessToken: authentification.accessToken)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            
            if let error = error {
                NSLog("Error signing in with Google: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let BabyBundleNC = storyboard.instantiateViewController(withIdentifier: "BabyTabBarController")
                
                self.present(BabyBundleNC, animated: true, completion:  nil)
            }
        }
    }
    
     func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("User Disconnected")
    }
    
    
    
    private func setupSignInButton() {
        
        let signInButton = GIDSignInButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        
        let buttonCenterXContraint = signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let buttonCenterYContraint = signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let buttonWidthContraint = signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        
        view.addConstraints([buttonCenterXContraint,
                            buttonCenterYContraint,
                            buttonWidthContraint])
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
