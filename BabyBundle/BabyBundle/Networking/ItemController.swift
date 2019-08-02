//
//  ItemController.swift
//  BabyBundle
//
//  Created by Lambda_School_Loaner_148 on 8/1/19.
//  Copyright © 2019 Lambda_School_Loaner_148. All rights reserved.
//

import Foundation
import UIKit


class ItemController {
    
    init() {
        createShoppingList()
        setupUserDefault()
    }
    
    private(set) var shoppingItems: [Item] = []
    var user: User?
    
    
    var addItems: [Item] {
        return shoppingItems.filter { ($0.isAdded == true)}
    }
    
    func createShoppingList() {
        
        shoppingItems = [Item(name: "Stroller", imageName: "strollerOne", price: "$49.99"),
                         Item(name: "Bibs", imageName: "bibOne", price: "$9.99"),
                         Item(name: "Stroller", imageName: "strollerTwo", price: "$29.99"),
                         Item(name: "Bibs", imageName: "BibTwo", price: "$15.99"),
                         Item(name: "Play Pen", imageName: "anotherPen", price: "$50.00"),
                         Item(name: "Bottles", imageName: "bottles", price: "$19.99"),
                         Item(name: "Crib", imageName: "Crib", price: "$100"),
                         Item(name: "Play Pen", imageName: "playPen", price: "$79.99"),
                         Item(name: "Crib", imageName: "bearCrib", price: "$100.00"),
                         Item(name: "Crib", imageName: "disignerCrib", price: "$150.00")]
        
        UserDefaults.standard.set(true, forKey: "user")
    }
    
    func toggleItemHasBeenAdded(shoppingItem: Item) {
        
        guard let index = shoppingItems.firstIndex(of: shoppingItem) else { return }
        shoppingItems[index].isAdded.toggle()
        
    }
    
    
    
    func createUser(newUser: User) {
        
        
    }
    
   private var itemListURL: URL? {
        let fileManager = FileManager.default
        guard let document = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return document.appendingPathComponent("babyBundle.plist")
        
    }
    
    private func saveToPersistentStore() {
        
        guard let url = itemListURL else { return }
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            NSLog("Error loading from PersistentStore: \(error)")
            
        }
    }
    
    private func loadFromPersistentStore() {
        guard let url = itemListURL, FileManager.default.fileExists(atPath: url.path) else { return }
        
        let decoder = PropertyListDecoder()
        
        do {
            let data = try Data(contentsOf: url)
            shoppingItems = try decoder.decode([Item].self, from: data)
            
        } catch {
            NSLog("Error decoding items from Persistent store: \(error)" )
        }
    }
    
    private func setupUserDefault() {
        let userDefault = UserDefaults.standard
        let user = userDefault.bool(forKey: "user")
        
        if user {
            loadFromPersistentStore()
        } else {
            createShoppingList()
        }
    }
    
    
}
