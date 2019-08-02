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
import AVFoundation
import AVKit

class SignInViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    
    @IBOutlet weak var videoView: UIView!
    var player: AVPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupVideo()
        setupSignInButton()
        
        let signIn = GIDSignIn.sharedInstance()
        
        signIn?.delegate = self
        signIn?.uiDelegate = self
        signIn?.signInSilently()
        

     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
     //  setupVideo()
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
    
    private func setupVideo() {
        
        let videoPath = Bundle.main.path(forResource: "Baby", ofType: ".mp4")
        
        player = AVPlayer(url: URL(fileURLWithPath: videoPath!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        
        
    NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        
        player!.seek(to: CMTime.zero)
        player!.play()
        self.player?.isMuted = true
        
       
        
        }
    
    @objc private func playerItemDidReachEnd() {
        player!.seek(to: CMTime.zero)
        
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
    
    

 

}
