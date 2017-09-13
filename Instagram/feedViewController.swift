//
//  feedViewController.swift
//  Instagram
//
//  Created by Salem Abdulla on 9/12/17.
//  Copyright © 2017 Hoang Thu Ha. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


class feedViewController: UIViewController{


        @IBOutlet weak var tableView: UITableView!
    
    
    var posts = [Post]()
    var databaseRef: DatabaseReference!
    var storageRef: StorageReference!
    
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseApp.configure()
        databaseRef = Database.database().reference()
        storageRef = Storage.storage().reference()


}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        

}

}
