//
//  ItemCollectionViewCell.swift
//  BabyBundle
//
//  Created by Lambda_School_Loaner_148 on 7/30/19.
//  Copyright © 2019 Lambda_School_Loaner_148. All rights reserved.
//

import UIKit

protocol ItemCollectionCellDelegate {
    func toggleHasBeenAdded(on cell: ItemCollectionViewCell)
}

class ItemCollectionViewCell: UICollectionViewCell {
    
    var delegate: ItemCollectionCellDelegate?
    var shoppingItem: Item? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBAction func addButtonTapped(_ sender: Any) {
        delegate?.toggleHasBeenAdded(on: self)
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        itemName.text = shoppingItem.name
        itemPrice.text = shoppingItem.price
        imageView.image = UIImage(named: shoppingItem.imageName)
        
    }
    
}
