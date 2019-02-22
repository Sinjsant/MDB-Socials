//
//  FeedViewController.swift
//  MDB Mini Project 3
//
//  Created by Sinjon Santos on 2/19/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class FeedViewController: UIViewController {
    
    var feedTableView : UITableView!
    var allEvents: [Event]! = [] {
        didSet {
            feedTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAllEvents();
        
        
        let backButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        backButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = backButton
        
        let createButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(createNew))
        createButton.tintColor = .white
        createButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Poppins-SemiBold", size: 34)!],
                                            for: .normal)
        self.navigationItem.rightBarButtonItem = createButton
        
        

  
        // Old attempt to style navbar title
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Poppins-SemiBold", size: 24)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Poppins-SemiBold", size: 40)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationItem.title = "Events"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic

        

        
        feedTableView = UITableView(frame: CGRect(x: 10, y: (self.navigationController?.navigationBar.frame.height)!, width: view.frame.width-20, height: view.frame.height-100))
        feedTableView.dataSource = self
        feedTableView.delegate = self
        feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "eventCell")
        view.addSubview(feedTableView)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Show the navigation bar on the this view controller
        self.navigationController?.navigationBar.barTintColor = .blue
        self.navigationController?.navigationBar.backgroundColor = .blue

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Hide the navigation bar on next view controllers
        // Is this even necessary?
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.view.backgroundColor = .clear
    }
    
    
    @objc func logout() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func createNew() {
        performSegue(withIdentifier: "toCreate", sender: self)
    }
    
    func loadAllEvents() {
        Database.database().reference().child("event").observe(.value) { (snap) in
            var allEventsTemp : [Event] = []
            for child in snap.children {
                let eventDict = (child as! DataSnapshot).value as! NSDictionary
                let name = eventDict.value(forKey: "name") as! String
                let date = eventDict.value(forKey: "date") as! String
                let description = eventDict.value(forKey: "description") as! String
                let interested = eventDict.value(forKey: "interested") as! Int
                let owner = eventDict.value(forKey: "owner") as! String
                
                let newEvent = Event(withName: name, ownedBy: owner, dated: date, description: description, interested: interested)
                allEventsTemp.append(newEvent)
            }
            allEventsTemp = allEventsTemp.sorted(by: {$0.getDate() > $1.getDate()})
            self.allEvents = allEventsTemp
        }
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}