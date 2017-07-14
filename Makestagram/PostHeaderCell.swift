//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by Alikeju Adejo on 7/14/17.
//  Copyright © 2017 Alikeju Adejo. All rights reserved.
//

import Foundation
import UIKit

class PostHeaderCell: UITableViewCell {
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func optionsButtonTapped(_ sender: Any) {
        print("options button tapped")
    }
}
