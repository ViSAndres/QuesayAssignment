import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var singUpButton: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        ageField.delegate = self
        countryField.delegate = self
    }
    
    @IBAction func didTapSignUpButton(_ sender: UIButton) {
        if let name = nameField.text,
           let email = emailField.text,
           let password = passwordField.text,
           let age = ageField.text,
           let country = countryField.text {
            let signUpInfo = [name, email, password, age, country]
            createFirebaseUser(userLoginInfo: signUpInfo)
        } else {
            let dialogMessage = UIAlertController(title: "Oops", message: "Please fill in all info.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Cloe", style: .default, handler: { (action) -> Void in
                 print("Ok button tapped")
            })
             dialogMessage.addAction(ok)
             self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    private func createFirebaseUser(userLoginInfo: [String]) {
        let firebaseManager = FirebaseAuthManager()
        firebaseManager.createUser(signUpInfo: userLoginInfo) {[weak self] (success) in
            guard self != nil else { return }
            if (success) {
                let firestore = FirebaseFirestoreManager()
                firestore.setUserInfo(userInfo: userLoginInfo)
                print("User was sucessfully created.")
                self!.leaveLoginScreen()
            } else {
                print("There was an error.")
            }
        }
    }
    
    private func leaveLoginScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "FeedViewController")
        mainTabBarController.modalPresentationStyle = .fullScreen
        self.present(mainTabBarController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }

}
