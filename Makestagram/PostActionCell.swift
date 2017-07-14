//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Alikeju Adejo on 7/14/17.
//  Copyright © 2017 Alikeju Adejo. All rights reserved.
//

import Foundation
import UIKit

class PostActionCell: UITableViewCell {

    
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    @IBAction func likeActionButton(_ sender: Any) {
        print("Like Button Tapped")
    }

}
