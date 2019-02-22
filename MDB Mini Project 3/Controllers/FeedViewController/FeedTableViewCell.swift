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
    var icon : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func initCellFrom(size: CGSize) {
        
       
        eventImage = UIImageView(frame: CGRect(x: 0, y: 10, width: size.width, height: size.height-30))
        eventImage.image = UIImage(named: "event1")
        eventImage.contentMode = .scaleToFill
        eventImage.layer.cornerRadius = 22
        eventImage.layer.masksToBounds = true
        eventImage.alpha = 1.0
        contentView.addSubview(eventImage)

        
        let imageTint = UIView()
        imageTint.backgroundColor = UIColor(white: 0, alpha: 0.4)
        imageTint.frame = eventImage.frame
        imageTint.layer.cornerRadius = 22
        
        contentView.addSubview(imageTint)
        
        nameLabel = UILabel(frame: CGRect(x: 10, y: size.height-70, width: size.width-20, height: 40))
        nameLabel.text = "Gryffin @ Bill Graham"
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.3
        nameLabel.font = UIFont(name: "Poppins-Bold", size: 32)
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        contentView.addSubview(nameLabel)
        
        ownerLabel = UILabel(frame: CGRect(x: 10, y: nameLabel.frame.maxY-70, width: size.width-20, height: 30))
        ownerLabel.text = "ASUC Superb"
        ownerLabel.numberOfLines = 1
        ownerLabel.adjustsFontSizeToFitWidth = true
        ownerLabel.minimumScaleFactor = 0.3
        ownerLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        ownerLabel.textColor = .white
        ownerLabel.textAlignment = .left
        contentView.addSubview(ownerLabel)
        
        icon = UIImageView(frame: CGRect(x: size.width-45, y: 22, width: 30, height: 30))
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(named: "person")
        contentView.addSubview(icon)
        
        numLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        numLabel.center = CGPoint(x: icon.frame.center.x, y: icon.frame.maxY + 20)
        numLabel.text = "74"
        numLabel.adjustsFontSizeToFitWidth = true
        numLabel.minimumScaleFactor = 0.3
        numLabel.font = UIFont(name: "Poppins-Medium", size: 26)
        numLabel.textColor = .white
        numLabel.textAlignment = .center
        contentView.addSubview(numLabel)
        
        
    }

        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  

}
