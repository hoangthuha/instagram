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
        
        
//        let userimages = Post()
//        if let userImage = UIImage(named: "imgetest") {
//        userimages.imageurl = userImage
//            
//        }
//        posts.append(userimages)
        
        
        tableView.dataSource = self
        
//        tableView.delegate = self
        
        
        fetchpost()
        
        tableView.reloadData()



}
    func fetchpost(){
        
        databaseRef = Database.database().reference()
        
        databaseRef.child("posts").observe(.childAdded, with: { (snapshot) in
            
            guard let mypost = snapshot.value as? [String: Any]
                else {return}
            
            
            
        if let imageurl = mypost["imageurl"] as? String,
            let userid = mypost["userid"] as? String {

                
//            let newPost = mypost(imageName: post)
                
                
                
            let newPost = Post(anID: userid, imageName: imageurl)
            
            self.posts.append(newPost)
            self.tableView.reloadData()
            
        }
            
        })

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
        
        
        cell.postImageView.loadImage(from: post.imageurl)
        
        
        //return cell
        return cell
    }
}



