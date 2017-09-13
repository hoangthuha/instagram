//
//  Post.swift
//  Instagram
//
//  Created by Salem Abdulla on 9/13/17.
//  Copyright © 2017 Hoang Thu Ha. All rights reserved.
//

import Foundation
import UIKit

class Post {

    var image : UIImage = UIImage(named: "unknown") ?? UIImage()
    
    
    init() {}
    
    init(imageName : String) {

        if let userImage = UIImage(named: imageName){
            self.image = userImage
            
        }else{
            self.image = UIImage()
        }
        
    }
}
