import UIKit
import Firebase

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        self.feedTableView.register(UINib.init(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostCell")
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
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "NewPostCell", for: indexPath) as! PostTabelViewCell
        cell.selectionStyle = .none
        cell.postImage.image = UIImage(named: "ugandanknuck")
        cell.postTitle.text = "Hiiiiii :)"
        cell.postTextBody.text = infoMessage
        
        return cell
    }
    
}
