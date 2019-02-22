//
//  InitialViewController.swift
//  MDB Mini Project 3
//
//  Created by Sinjon Santos on 2/13/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit
import Material

class InitialViewController: UIViewController {
    
    var loginButton : Button!
    var registerButton : Button!
    var titleLabel : UILabel!
    var heroImage : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        InitialViewController.printFontFamilies()
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/4))
        titleLabel.center = CGPoint(x: view.frame.width/2, y: 180)
        titleLabel.text = "Socials"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Poppins-Bold", size: 90)
        titleLabel.textColor = .blue
//        titleLabel.layer.borderWidth = 2
//        titleLabel.layer.borderColor = UIColor.black.cgColor
        view.addSubview(titleLabel)
        
        loginButton = Button(frame: CGRect(x: view.frame.width/2-112.5, y: view.frame.maxY - 270, width: 225, height: 60))
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel!.font = UIFont(name: "Poppins-SemiBold", size: 28)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor.blue
        loginButton.pulseColor = .white
        loginButton.layer.cornerRadius = loginButton.frame.height/2
        loginButton.addTarget(self, action: #selector(openLogin), for: .touchUpInside)
        view.addSubview(loginButton)
        
        registerButton = Button(frame: CGRect(x: view.frame.width/2-112.5, y: loginButton.frame.maxY + 20, width: 225, height: 60))
        registerButton.setTitle("Sign Up", for: .normal)
        registerButton.titleLabel!.font = UIFont(name: "Poppins-SemiBold", size: 28)
        registerButton.setTitleColor(UIColor.blue, for: .normal)
        registerButton.pulseColor = .blue
        registerButton.layer.cornerRadius = registerButton.frame.height/2
        registerButton.layer.borderColor = UIColor.blue.cgColor
        registerButton.layer.borderWidth = 2
        registerButton.addTarget(self, action: #selector(openRegister), for: .touchUpInside)

        view.addSubview(registerButton)
        
        heroImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        heroImage.center = CGPoint(x: view.frame.width/2, y: view.frame.height/2-50)
        heroImage.image = UIImage(named: "party")
        heroImage.contentMode = .scaleAspectFit
        view.addSubview(heroImage)
        
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        
    
        

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        // I need these for it to work
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.backgroundColor = .clear
        // I don't actually know if I need these
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = .clear
        self.navigationController?.view.backgroundColor = .clear
    }
    
    public static func printFontFamilies() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    @objc func openLogin() {
        performSegue(withIdentifier: "toLogin", sender: self)
    }
    
    @objc func openRegister() {
        performSegue(withIdentifier: "toRegister", sender: self)
    }


}

