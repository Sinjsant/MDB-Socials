//
//  FeedViewController.swift
//  MDB Mini Project 3
//
//  Created by Sinjon Santos on 2/19/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var feedTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let backButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        backButton.tintColor = .white
        backButton.title = "Logout"
        
        self.navigationItem.leftBarButtonItem = backButton
        
        
        // Attempt to style navbar title
//        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 225, height: 60))
//        titleLabel.center = CGPoint(x: view.frame.width/2, y: 50)
//        titleLabel.text = "Events"
//        titleLabel.font = UIFont(name: "Poppins-SemiBold", size: 24)
//        titleLabel.textColor = .white
//        titleLabel.textAlignment = .center
//        self.navigationItem.titleView = titleLabel
//
  
        // Old attempt to style navbar title
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Poppins-Bold", size: 24)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Poppins-Bold", size: 40)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationItem.title = "Events"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        

        
        feedTableView = UITableView(frame: CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.height)!, width: view.frame.width-40, height: view.frame.height-100))
        feedTableView.dataSource = self
        feedTableView.delegate = self
        feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "eventCell")
        view.addSubview(feedTableView)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.navigationBar.barTintColor = .blue
        self.navigationController?.navigationBar.backgroundColor = .blue

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
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
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
