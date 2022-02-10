import FirebaseAuth
import UIKit


class FirebaseAuthManager {
    
    func createUser(signUpInfo: [String], completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: signUpInfo[1], password: signUpInfo[2]) { [self](authResult, error) in
            if let user = authResult?.user {
                print("User ID: \(user.uid) for user: \(String(describing: user.displayName))")
                setUserName(name: signUpInfo[0], completionBlock: { (success) in
                    if(success) {
                        completionBlock(true)
                    }}) } else {
                completionBlock(false)
                print(error!)
            }
        }
    }
    
    func setUserName(name: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges { error in
            if(error != nil){
                print(error!)
                completionBlock(false)
            } else  {
                print("Stored user name")
                completionBlock(true)
            }
        }
    }
    
}
