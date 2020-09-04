
import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        print("Pressed")
        // Registering user to Firebase.
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            // if password or email field are empty, display alert
            if password == "" || email == "" {
                let alert = UIAlertController(title: "Please enter email and password to register", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                    self.present(alert, animated: true)
            } else {
                // Auth object prints to console an error if password field is less than 6 characters. FirebaseAuht already has password validation
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        // display error alert if there's an error
                        let alert = UIAlertController(title: e.localizedDescription, message: nil, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                            self.present(alert, animated: true)
                        
                        print(e.localizedDescription)   // e.localizedDescription : displays error in user's language setting
                    } else {
                           self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    }
                }
            }
        }
    }
    
    
}
