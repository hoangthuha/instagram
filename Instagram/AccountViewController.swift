import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth

class AccountViewController: UIViewController {
    
    var users : [User] = []
    
    var newNameAppear = ""
    var newDescAppear = ""

    
    @IBOutlet weak var nameAccount: UILabel!
    @IBOutlet weak var descAccount: UITextView!
    @IBOutlet weak var imgAccount: UIImageView!
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        myVC.nameAccountPassed = nameAccount.text!
        myVC.descAccountPassed = descAccount.text!
        myVC.imageAccountPassed = imgAccount.image!
        navigationController?.pushViewController(myVC, animated: true)
        present(myVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let username = authData.providerData["name"]
        
        
        
        nameAccount.text = newNameAppear
        descAccount.text = newDescAppear
        nameAccount.isEnabled = false
        descAccount.isEditable = false

        
      
    }
    
    
    


}
