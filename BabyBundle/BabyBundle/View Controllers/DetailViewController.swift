
//
//  DetailViewController.swift
//  BabyBundle
//
//  Created by Lambda_School_Loaner_148 on 8/1/19.
//  Copyright © 2019 Lambda_School_Loaner_148. All rights reserved.
//

import UIKit
import MessageUI

class DetailViewController: UIViewController, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    var itemController: ItemController?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       updateViews()
        tableView.dataSource = self
    }
    
    private func updateViews() {
        self.view.backgroundColor = UIColor(displayP3Red: 255/255, green: 155/255, blue: 170/255, alpha: 1.0)

       
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemController?.addItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddedItemCell", for: indexPath)
        
        guard let addedItemCell = cell as? AddedItemTableViewCell else { return cell }
        
        let addedItem = itemController?.addItems[indexPath.row]
        addedItemCell.imageView?.image = UIImage(named: addedItem!.imageName)
        addedItemCell.priceLabel.text = addedItem?.price
        
        
        return addedItemCell
    }
    
    
    @IBAction func sendItemsButtonTapped(_ sender: Any) {
        showMailComposer()
        
        
    }
    
    private func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            return NSLog("Device cant send mail")
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setSubject("My Regristry Picks")
        composer.setMessageBody("Here are the items I need. \(itemController?.addItems.map({$0.name}) ?? ["I'm all good here"])", isHTML: false)
        
        present(composer, animated: true)
        
        
        }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            NSLog("email Cancelled")
        case .saved:
            NSLog("Email Faild to Send")
        case .sent:
            NSLog("Email Sent")
        case .failed:
            NSLog("Email Failed")
        @unknown default:
            fatalError()
        }
        
        controller.dismiss(animated: true)
    }
    

}
