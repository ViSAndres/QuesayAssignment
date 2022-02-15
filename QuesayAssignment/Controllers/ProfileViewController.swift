import UIKit
import Firebase

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UITextField!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var profileCountry: UILabel!
    @IBOutlet weak var profileAge: UILabel!
    @IBOutlet weak var profilePostCount: UILabel!
    
    let firestroreManager = FirebaseFirestoreManager()
    
    let infoMessage = """
        Do you want to be always happy?
        Then give up fighting
        For negativity
        And learn the beautiful art
        Of self-encouragement.
    """
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        makeProfileCircular()
        setUserInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileTableView.register(UINib.init(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostCell")

        
        updateUserInfo()
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }
    
    private func setUserInfo() {
        setUserName()
        setUserAge()
        setUserCountry()
        setUserPostCount()
    }
    
    private func setUserAge() {
        firestroreManager.getUserAge(completionBlock: { (age) in
            if((age) != nil) {
                self.profileAge.text = age
            } else {
                print("error getting age")
            }
        })
    }
    
    private func setUserCountry() {
        firestroreManager.getUserCountry(completionBlock: { (country) in
            if((country) != nil) {
                self.profileCountry.text = country
            } else {
                print("error getting age")
            }
        })
    }
    
    private func setUserPostCount() {
        firestroreManager.getUserPostCount(completionBlock: { (count) in
            if((count) != nil) {
                self.profilePostCount.text = count
            } else {
                print("error getting post count")
            }
        })
    }
    
    private func setUserName() {
        let user = Auth.auth().currentUser
        if let user = user {
            if let userName  = user.displayName {
                profileName.text = userName
            }
        }
    }
    
    private func updateUserInfo() {
        setUserInfo()
    }
    
    private func makeProfileCircular() {
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        cell.selectionStyle = .none
        cell.postTitle.text = "I will show you the way"
        cell.postTextBody.text = infoMessage
        cell.postImage.image = UIImage(named: "happy")
        return cell
    }
}
