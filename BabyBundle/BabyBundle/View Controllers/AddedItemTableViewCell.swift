//
//  AddedItemTableViewCell.swift
//  BabyBundle
//
//  Created by Lambda_School_Loaner_148 on 8/2/19.
//  Copyright © 2019 Lambda_School_Loaner_148. All rights reserved.
//

import UIKit

class AddedItemTableViewCell: UITableViewCell {

  
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
