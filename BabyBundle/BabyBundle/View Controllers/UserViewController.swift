//
//  UserViewController.swift
//  BabyBundle
//
//  Created by Lambda_School_Loaner_148 on 8/1/19.
//  Copyright © 2019 Lambda_School_Loaner_148. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var itemController = ItemController()
   
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.view.backgroundColor = UIColor(displayP3Red: 255/255, green: 155/255, blue: 170/255, alpha: 1.0)
        
        startButton.backgroundColor = .white
        startButton.layer.cornerRadius = 8.0
        
        
    }
    
    
    

    @IBAction func getStartedButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let BabyBundleNC = storyboard.instantiateViewController(withIdentifier: "BabyTabBarController")
        
        self.present(BabyBundleNC, animated: true, completion:  nil)

        
        
        
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
