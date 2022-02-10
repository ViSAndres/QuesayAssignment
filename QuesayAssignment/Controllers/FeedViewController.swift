import UIKit
import Firebase

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
    let infoMessage = """
    Do you want to be always happy?
    Then give up fighting
    For negativity
    And learn the beautiful art
    Of self-encouragement.
    """
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        cell.selectionStyle = .none
        cell.feedPostTitle?.text = "I will show you the way"
        cell.feedPostText?.text = infoMessage
        cell.feedPostImage?.image = UIImage(named: "ugandanknuck")
        cell.feedUserName?.text = Auth.auth().currentUser?.displayName
        return cell
    }
    
}
