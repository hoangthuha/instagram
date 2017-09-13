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

    
    
    var userid : String = ""
    
    var imageurl : String = ""
    
    
//        : UIImage = UIImage(named: "unknown") ?? UIImage()
    
    
    init() {}
    
    init(anID: String, imageName : String) {

        
        userid = anID
        imageurl = imageName
        
//        if let userImage = UIImage(named: imageName){
//            self.imageurl = userImage
//            
//        }else{
//            self.imageurl = UIImage()
//        }
        
    }
}
