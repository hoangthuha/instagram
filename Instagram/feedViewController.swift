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


class feedViewController: UIViewController, UITableViewDelegate{

@IBOutlet weak var tableView: UITableView!
    
    
    var posts: [Post] = []
    
    
    var databaseRef: DatabaseReference!
    var storageRef: StorageReference!
    
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        
//        FirebaseApp.configure()
//        databaseRef = Database.database().reference()
//        storageRef = Storage.storage().reference()
        
        
        let userimages = Post()
        if let userImage = UIImage(named: "imgetest"){
            userimages.image = userImage
            
        }
        posts.append(userimages)
        
        
        tableView.dataSource = self
        
//        tableView.delegate = self
        
        tableView.reloadData()



}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        

}

}
extension feedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1 get the cell
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PostTableViewCell
            else{ return UITableViewCell() }
        
        
        //2 Setup
        let post = posts[indexPath.row]
        
        
        cell.postImageView.image = post.image
        
        
        //return cell
        return cell
    }
}



