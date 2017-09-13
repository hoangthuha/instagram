import UIKit
import FirebaseDatabase
import FirebaseAuth

class EditViewController: UIViewController {
    
    var users : Users = Users(userName: "", description: "", imageAccount: "")
    var nameAccountPassed = ""
    var descAccountPassed = ""
    var imageAccountPassed = UIImage()
    
    @IBOutlet weak var nameEdit: UITextField!
    @IBOutlet weak var imageEdit: UIImageView!
    @IBOutlet weak var descEdit: UITextView!
    
    @IBAction func editButtonTapped(_ sender: Any) {
        nameEdit.text = ""
        descEdit.text = ""
        nameEdit.isUserInteractionEnabled = true
        descEdit.isUserInteractionEnabled = true
        
    }
    @IBAction func changeButtonTapped(_ sender: Any) {
        let a = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destination = a.instantiateViewController(withIdentifier: "AccountViewController") as? AccountViewController
            else {return}
        destination.newNameAppear = nameEdit.text!
        destination.newDescAppear = descEdit.text
        navigationController?.pushViewController(destination, animated: true)
        present(destination, animated: true, completion: nil)

    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {return}
            
            self.present(vc, animated: true, completion: nil)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameEdit.text = nameAccountPassed
        descEdit.text = descAccountPassed
        imageEdit.image = imageAccountPassed
        nameEdit.isUserInteractionEnabled = false
        descEdit.isUserInteractionEnabled = false
       
    }
    
    
    
    
}
