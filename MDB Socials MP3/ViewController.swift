//
//  DetailViewController.swift
//  MDB Socials MP3
//
//  Created by Neha Nagabothu on 2/19/19.
//  Copyright © 2019 Neha Nagabothu. All rights reserved.


import UIKit
import Firebase

class ViewController: UIViewController {
    
    var social: Social!
    var user: User!
    var eName: UILabel!
    var eImg: UIImageView!
    var eDescription: UILabel!
    var eDate: UILabel!
    var creator: UILabel!
    var intB: UIButton!
    var intVal: UILabel!
    var pplInterested = 0
    var backB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        eName = UILabel(frame: CGRect(x:view.frame.width/2-75, y: 20, width: 150, height: 150))
        eName.text = "Name: \(social.title!)"
        eName.textAlignment = .center
        view.addSubview(eName)
        
        eImg = UIImageView(frame: CGRect(x: 0, y: 100, width: 250, height: 250))
        eImg.contentMode = .scaleAspectFit
        view.addSubview(eImg)
        downloadImg()
        
        eDescription = UILabel(frame: CGRect(x: 0, y: 440, width: view.frame.width, height: 30))
        eDescription.text = eDescription.text = "Description: \(social.socialText!)"
        eDescription.textAlignment = .center
        view.addSubview(eDescription)
        
        eDate = UILabel(frame: CGRect(x: 0, y: 400, width: 250, height: 50))
        eDate.text = "Date: \(social.date!)"
        eDate.textAlignment = .center
        view.addSubview(eDate)
        
        creator = UILabel(frame: CGRect(x: 0, y: 380, width: 250, height: 50))
        creator.text = "Creator: \(social.host!)"
        creator.textAlignment = .center
        view.addSubview(creator)
        
        backB = UIButton(frame: CGRect(x: 10, y: 20, width: view.frame.width * 0.1, height: view.frame.width * 0.1))
        backB.setTitle("Back", for: .normal)
        backB.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        self.view.addSubview(backB)

        intB = UIButton(frame: CGRect(x: 10, y: view.frame.height * 0.9, width: view.frame.width/3 - 30, height: 30))
        intB.setTitle("Interested", for: .normal)
        intB.addTarget(self, action: #selector(whoIsInterested), for: .touchUpInside)
        self.view.addSubview(intB)
        
        intVal = UILabel(frame: CGRect(x: ((2*view.frame.width)/3) - (view.frame.width/2), y: view.frame.height * 0.8, width: view.frame.width/2, height: 30))
        intVal.text = "\(pplInterested) people interested"
        intVal.textAlignment = .center
        view.addSubview(intVal)
        

        
    }
    
    @objc func whoIsInterested() {
        pplInterested = pplInterested + 1
        intVal.text = "\(pplInterested) people are interested!"
        intB.isEnabled = false
    }
    
    func downloadImg() {
        social.getImage(withBlock: { profileImage in
            DispatchQueue.main.async {
                self.eImg.image = (profileImage)
            }
        })
    }
    
    @objc func backPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

