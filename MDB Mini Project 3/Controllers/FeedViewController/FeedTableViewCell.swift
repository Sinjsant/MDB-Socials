//
//  FeedTableViewCell.swift
//  MDB Mini Project 3
//
//  Created by Sinjon Santos on 2/19/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit
import Material

class FeedTableViewCell: UITableViewCell {
    
    var eventImage : UIImageView!
    var nameLabel : UILabel!
    var ownerLabel : UILabel!
    var numLabel : UILabel!
    var rsvpIcon : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func initCellFrom(size: CGSize) {
        
        eventImage = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height-30))
        eventImage.image = UIImage(named: "event1")
        eventImage.contentMode = .scaleToFill
        eventImage.layer.cornerRadius = 20
        eventImage.layer.masksToBounds = true
        eventImage.alpha = 1.0
        contentView.backgroundColor = .clear
        contentView.addSubview(eventImage)

        
        let imageTint = UIView()
        imageTint.backgroundColor = UIColor(white: 0, alpha: 0.4)
        imageTint.frame = eventImage.frame
        
        contentView.addSubview(imageTint)
        
        nameLabel = UILabel(frame: CGRect(x: 20, y: size.height-80, width: size.width-30, height: 40))
        nameLabel.text = "Gryffin @ Bill Graham"
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.3
        nameLabel.font = UIFont(name: "Poppins-Bold", size: 30)
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        contentView.addSubview(nameLabel)
    }

        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  

}
