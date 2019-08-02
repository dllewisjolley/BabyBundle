//
//  ItemModel.swift
//  BabyBundle
//
//  Created by Lambda_School_Loaner_148 on 7/30/19.
//  Copyright © 2019 Lambda_School_Loaner_148. All rights reserved.
//

import Foundation


struct Item: Equatable, Codable {
    

    var name: String
    var isAdded: Bool
    var imageName: String
    var price: String
    
    init(name: String, isAdded: Bool = false, imageName: String, price: String) {
        
        self.name = name
        self.isAdded = isAdded
        self.imageName = imageName
        self.price = price
        
    }
    
    
}
