import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if the user has login
        if Auth.auth().currentUser != nil {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController else {return}
            
            //  skip login page  / go to homepage
            present(vc, animated: true, completion: nil)
        }
        
    }
    
    func loginUser() {
        guard let email = emailTextField.text else {return}
        
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if self.emailTextField.text == "" {
                self.createErrorAlert("Empty email field", "Please input valid Email")
                return
            } else if self.passwordTextField.text == "" {
                self.createErrorAlert("Empty password field", "Please input valid password")
                return
            }
            
            if let validError = error {
                print(validError.localizedDescription)
                self.createErrorAlert("Error", validError.localizedDescription)
            }
            
            if let validUser = user {
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController else {return}
                print(validUser)
                
                self.present(vc, animated: true, completion: nil)
            } //valid user
            
        } //auth
        
    } //login user
    
    func createErrorAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}
