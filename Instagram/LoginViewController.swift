import UIKit
import FirebaseAuth
import Firebase
import FacebookLogin
import FBSDKLoginKit


class LoginViewController: UIViewController {
    
    var dict : [String : AnyObject]!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var buttonPressedtwo: UIButton!
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getFBUserData()
            }
        }
        
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        
//        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
//        loginButton.center = view.center
//        view.addSubview(loginButton)
        
        //check if the user has login
        
        
//        if Auth.auth().currentUser != nil {
//            guard let vc = storyboard?.instantiateViewController(withIdentifier: "feedViewController") as? feedViewController else {return}
//            
//            //  skip login page  / go to homepage
//            present(vc, animated: true, completion: nil)
//    
//
//            
//        }
        
    }

    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if ((error) != nil) {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // Navigate to other view
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
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as? UITabBarController else {return}
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
