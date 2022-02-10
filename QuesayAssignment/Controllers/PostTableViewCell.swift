//
//  PostTableViewCell.swift
//  QuesayAssignment
//
//  Created by Carlos Neira on 2/8/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var feedPostImage: UIImageView!
    @IBOutlet weak var feedPostTitle: UILabel!
    @IBOutlet weak var feedPostText: UILabel!
    @IBOutlet weak var feedUserName: UILabel!
    
    @IBOutlet weak var profilePostImage: UIImageView!
    @IBOutlet weak var profilePostTitle: UILabel!
    @IBOutlet weak var profilePostText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
