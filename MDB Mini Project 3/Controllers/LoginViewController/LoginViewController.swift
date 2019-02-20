//
//  LoginViewController.swift
//  MDB Mini Project 3
//
//  Created by Sinjon Santos on 2/19/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit
import Material

class LoginViewController: UIViewController {
    
    var username : TextField!
    var password : TextField!
    var submitButton : Button!
    var heroImage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styles current navcontroller
        let navLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 70))
        navLabel.center = CGPoint(x: view.frame.width/2, y: 35)
        navLabel.font = UIFont(name: "Poppins-SemiBold", size: 32)
        navLabel.textColor = .blue
        navLabel.text = "Login"
        navLabel.textAlignment = .center
        self.navigationItem.titleView = navLabel
        
 


        
        
        username = TextField(frame: CGRect(x: 0, y: 0, width: 250, height: 60))
        username.center = CGPoint(x: view.frame.width/2, y: view.frame.midY + 50)
        username.placeholder = "username"
        username.textColor = .blue
        username.placeholderVerticalOffset = 10
        username.placeholderActiveColor = .blue
        username.dividerActiveColor = .blue
        username.font = UIFont(name: "Poppins-SemiBold", size: 25)
        username.autocapitalizationType = UITextAutocapitalizationType.none
        username.autocorrectionType = UITextAutocorrectionType.no
        
        view.addSubview(username)
        
        
        password = TextField(frame: CGRect(x: 0, y: 0, width: 250, height: 60))
        password.center = CGPoint(x: view.frame.width/2, y: username.frame.maxY + 75)
        password.placeholder = "password"
        password.textColor = .blue
        password.placeholderVerticalOffset = 10
        password.isSecureTextEntry = true
        password.placeholderActiveColor = .blue
        password.dividerActiveColor = .blue
        password.font = UIFont(name: "Poppins-SemiBold", size: 25)
        password.autocapitalizationType = UITextAutocapitalizationType.none
        password.autocorrectionType = UITextAutocorrectionType.no
        
        view.addSubview(password)
        
        
        submitButton = Button(frame: CGRect(x: 0, y: 0, width: 250, height: 60))
        submitButton.center = CGPoint(x: view.frame.width/2, y: password.frame.maxY + 100)
        submitButton.setTitle("Continue", for: .normal)
        submitButton.titleLabel!.font = UIFont(name: "Poppins-SemiBold", size: 28)
        submitButton.backgroundColor = .blue
        submitButton.layer.cornerRadius = submitButton.frame.height/2
        submitButton.pulseColor = .white
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.addTarget(self, action: #selector(openFeed), for: .touchUpInside)
        
        view.addSubview(submitButton)
        
        heroImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        heroImage.center = CGPoint(x: view.frame.width/2, y: 275)
        heroImage.image = UIImage(named: "dualipa")
        heroImage.contentMode = .scaleAspectFit
        view.addSubview(heroImage)
        
        
        
   
        

        // Do any additional setup after loading the view.
    }
    
    @objc func openFeed() {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        performSegue(withIdentifier: "toFeed", sender: self)
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
