//
//  UIImage+Size.swift
//  Makestagram
//
//  Created by Alikeju Adejo on 7/13/17.
//  Copyright © 2017 Alikeju Adejo. All rights reserved.
//

import Foundation
import UIKit

//We added a computed property to UIImage that will calculate the aspect height for the instance of a UIImage based on the size property of an image.

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
