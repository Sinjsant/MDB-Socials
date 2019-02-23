//
//  CreateViewController.swift
//  MDB Mini Project 3
//
//  Created by Sinjon Santos on 2/21/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Material

class CreateViewController: UIViewController {
    
    var eDescription: TextView!
    var eName: TextField!
    var eDate: UIDatePicker!
    let selectImage = UIImagePickerController()
    var imgB: UIButton!
    var imgView: UIImageView!
    var imgURL: String!
    var createB: UIButton!
    var cancelB: UIButton!
    var currentUser: User!
    var uid: String!
    var submitButton: Button!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Poppins-SemiBold", size: 24)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Poppins-SemiBold", size: 40)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationItem.title = "Create Event"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        currentUser = Auth.auth().currentUser
        if (currentUser != nil) {
            uid = currentUser.email
        }
        
        eName = TextField(frame: CGRect(x: 0, y: 0, width: 250, height: 60))
        eName.center = CGPoint(x: view.frame.width/2, y: view.frame.height/3)
        eName.placeholder = "Event name"
        eName.textColor = .blue
        eName.placeholderVerticalOffset = 10
        eName.placeholderActiveColor = .blue
        eName.dividerActiveColor = .blue
        eName.font = UIFont(name: "Poppins-SemiBold", size: 26)
        eName.autocapitalizationType = UITextAutocapitalizationType.none
        eName.autocorrectionType = UITextAutocorrectionType.no
        
        view.addSubview(eName)
        

        
        eDate = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
        eDate.center = CGPoint(x: view.frame.width/2, y: eName.frame.maxY + 90)
        eDate.datePickerMode = .date
        view.addSubview(eDate)
        
        
        
        eDescription = TextView(frame: CGRect(x: 0, y: 0, width: 250, height: 200))
        eDescription.center = CGPoint(x: view.frame.width/2, y: eDate.frame.maxY + 140)
        eDescription.placeholder = "Event description"
        eDescription.textColor = .blue
        eDescription.borderColor = .gray
        eDescription.layer.borderWidth = 1
        eDescription.font = UIFont(name: "Poppins-SemiBold", size: 22)
        eDescription.autocapitalizationType = UITextAutocapitalizationType.none
        eDescription.autocorrectionType = UITextAutocorrectionType.no
        view.addSubview(eDescription)
     
        submitButton = Button(frame: CGRect(x: 0, y: 0, width: 250, height: 60))
        submitButton.center = CGPoint(x: view.frame.width/2, y: eDescription.frame.maxY + 90)
        submitButton.setTitle("Create", for: .normal)
        submitButton.titleLabel!.font = UIFont(name: "Poppins-SemiBold", size: 28)
        submitButton.backgroundColor = .blue
        submitButton.layer.cornerRadius = submitButton.frame.height/2
        submitButton.pulseColor = .white
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        
        view.addSubview(submitButton)

        // Do any additional setup after loading the view.
    }
    
    @objc func submit(sender: UIButton!) {
        var values = [String: Any]()
        values["name"] = self.eName.text!
        values["description"] = self.eDescription.text!
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let dateText = formatter.string(from: self.eDate.date)
        values["date"] = dateText
        values["owner"] = self.uid
        values["interested"] = 0
        
        Database.database().reference().child("event").child(self.eName.text!).setValue(values, withCompletionBlock: { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
                print("it errored")
            }
            self.navigationController?.popViewController(animated: true)
        })
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
