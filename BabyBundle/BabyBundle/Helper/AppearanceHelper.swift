//
//  AppearanceHelper.swift
//  BabyBundle
//
//  Created by Lambda_School_Loaner_148 on 7/30/19.
//  Copyright © 2019 Lambda_School_Loaner_148. All rights reserved.
//

import Foundation
import UIKit

enum ThemeHelper {
    
    static let babyBlue = UIColor(displayP3Red: 149/255, green: 214/255, blue: 266/255, alpha: 1.0)
    
    static let salmonColor = UIColor(displayP3Red: 255/255, green: 155/255, blue: 170/255, alpha: 1.0)
    static func setupAppeareance() {
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = salmonColor
        UIBarButtonItem.appearance().tintColor = .white
        UITabBar.appearance().tintColor = salmonColor
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: salmonColor], for: .normal)
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
    }
}
