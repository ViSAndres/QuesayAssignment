//
//  PracticeTableViewCell.swift
//  QuesayAssignment
//
//  Created by Carlos Neira on 2/13/22.
//

import UIKit

class PostTabelViewCell: UITableViewCell {
    
    @IBOutlet weak var postTextView: UIView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postLikeButton: UIButton!
    @IBOutlet weak var postTextBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeCornersRound()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func makeCornersRound() {
        postImage.layer.cornerRadius = 15
        postImage.clipsToBounds = true
        postTextView.layer.cornerRadius = 15
        postTextView.clipsToBounds = true
        postTextView.layer.shadowColor = UIColor.black.cgColor
        postTextView.layer.shadowOffset = CGSize(width: 1, height: 1)
        postTextView.layer.shadowOpacity = 0.25
        postTextView.layer.shadowRadius = 2.0
        postLikeButton.layer.cornerRadius = 10
        postLikeButton.layer.shadowColor = UIColor.black.cgColor
        postLikeButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        postLikeButton.layer.shadowOpacity = 0.25
        postLikeButton.layer.shadowRadius = 2.0
    }
    
}
