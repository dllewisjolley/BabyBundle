//
//  ItemListViewController.swift
//  BabyBundle
//
//  Created by Lambda_School_Loaner_148 on 7/30/19.
//  Copyright © 2019 Lambda_School_Loaner_148. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController, UICollectionViewDataSource, ItemCollectionCellDelegate {
    
    
    let itemController = ItemController()
    var user: User?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    collectionView.dataSource = self
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    private func updateViews() {
        
        
        let salmonColor = UIColor(displayP3Red: 255/255, green: 155/255, blue: 170/255, alpha: 1.0)
        profileView.backgroundColor = salmonColor
       
        
        userView.backgroundColor = UIColor(displayP3Red: 255/255, green: 155/255, blue: 170/255, alpha: 0.8)
        userView.layer.cornerRadius = 8.0
        userImageView.layer.cornerRadius = 8.0
        
        userNameLabel.textColor = .white
        
        
        self.tabBarController?.tabBarItem.badgeColor = salmonColor
        
        
        
    }
    


    // MARK: - CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemController.shoppingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath)
        
        guard let itemCell = cell as? ItemCollectionViewCell else { return cell }
        let item = itemController.shoppingItems[indexPath.row]
        
        itemCell.shoppingItem = item
        itemCell.delegate = self
        
        if item.isAdded == false {
            itemCell.addButton.setImage(UIImage(named: "plus"), for: .normal)
        } else {
            itemCell.addButton.setImage(UIImage(named: "minus"), for: .normal)
        }

        
       
        
        return itemCell
    }
    
    
    func toggleHasBeenAdded(on cell: ItemCollectionViewCell) {
        guard let index = collectionView.indexPath(for: cell) else { return }
        let item = itemController.shoppingItems[index.item]
        itemController.toggleItemHasBeenAdded(shoppingItem: item)
        collectionView.reloadItems(at: [index])
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "DetailSegue" {
            guard let DetailVC = segue.destination as? DetailViewController else { return }
            DetailVC.itemController = itemController
        }
     }
    
}
