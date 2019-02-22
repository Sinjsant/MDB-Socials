//
//  NewEventVC.swift
//  MDB Socials MP3
//
//  Created by Neha Nagabothu on 2/19/19.
//  Copyright © 2019 Neha Nagabothu. All rights reserved.
//

import UIKit
import Firebase

class NewSocialViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var eDescription: UITextField!
    var eName: UITextField!
    var eDate: UITextField!
    let selectImage = UIImagePickerController()
    var imgB: UIButton!
    var imgView: UIImageView!
    var imgURL: String!
    var host: User!
    var createB: UIButton!
    var cancelB: UIButton!
    var database: FIRDatabaseReference = FIRDatabase.database().reference()
    var storage: FIRStorageReference = FIRStorage.storage().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        selectImage.delegate = self
        eName.placeholder = "Name"
        eName = UILabel(frame: CGRect(x:view.frame.width/2-75, y: 20, width: 150, height: 50))
        eName.adjustsFontSizeToFitWidth = true
        eName.layer.masksToBounds = true
        eName.textColor = .black
        view.addSubview(eName)
        
        createB = UIButton(frame: CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.65, width: view.frame.width * 0.4, height: 50))
        createB.setTitle("Create Social", for: .normal)
        createB.addTarget(self, action: #selector(createSocial), for: .touchUpInside)
        view.addSubview(createB)
        
        eDate.placeholder = "Date"
        eDate = UITextField(frame: CGRect(x: (3*view.frame.width)/10, y: view.frame.height * 0.3, width: view.frame.width * 0.6, height: 50))
        eDate.adjustsFontSizeToFitWidth = true
        eDate.layer.masksToBounds = true
        eDate.textColor = .black
        view.addSubview(eDate)
        
        eDescription.placeholder = "Description"
        eDescription = UITextField(frame: CGRect(x: view.frame.width * 0.2, y: view.frame.height * 0.4, width: view.frame.width * 0.6, height: 50))
        eDescription.adjustsFontSizeToFitWidth = true
        eDescription.layer.masksToBounds = true
        eDescription.textColor = .black
        view.addSubview(eDescription)
        imgView = UIImageView(frame: CGRect(x: (view.frame.width*4)/10, y: view.frame.height/2, width: (view.frame.width*4)/10, height: 50))
        imgB = UIButton(frame: imgView.frame)
        imgB.setTitle("Image Selection", for: .normal)
        imgB.setTitleColor(.black, for: .normal)
        imgB.addTarget(self, action: #selector(loadImagePressed), for: .touchUpInside)
        view.addSubview(imgView)
        view.addSubview(imgB)
        view.bringSubview(toFront: imgB)
        
        cancelB = UIButton(frame: CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.75, width: view.frame.width * 0.4, height: 50))
        cancelB.setTitle("Back", for: .normal)
        cancelB.addTarget(self, action: #selector(cancelEntry), for: .touchUpInside)
        view.addSubview(cancelB)
    }
    
    func createSocial(sender: UIButton!) {
        storage = storage.child("profilepics/\((database.child("Posts").childByAutoId().key))")
        
        let imgData = UIImageJPEGRepresentation(imgView.image!, 0.9)
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/jpeg"
        
        storage.put(imgData!, metadata: metadata).observe(.success) { (snapshot) in
            self.imgURL = snapshot.metadata?.downloadURL()?.absoluteString
            let newSocial = ["name": self.eName.text!, "title": self.eName.text!, "date": self.eDate.text!, "text": self.eDescription.text!, "poster": self.host?.name, "posterId": self.host?.id, "imageURL": self.imgURL] as [String : Any]
            
            self.uploadPics(id: self.database.child("Posts").childByAutoId().key) {
                let key = self.database.child("Posts").childByAutoId().key
                let childUpdates = ["/\(key)/": newSocial]
                self.database.child("Posts").updateChildValues(childUpdates)
            }
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func loadImgPressed(sender: UIButton!) {
        selectImage.allowsEditing = false
        selectImage.sourceType = .photoLibrary
        present(selectImage, animated: true, completion: nil)
    }
    
    @nonobjc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imgB.removeFromSuperview()
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imgView.contentMode = .scaleAspectFit
            imgView.image = pickedImage
        }
        dismiss(animated:true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func uploadPics(id: String, withBlock: @escaping () -> ()) {
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/jpeg"
        storage.child("profilepics/\((id))").put(UIImageJPEGRepresentation(imgView.image!, 0.9)!, metadata: metadata).observe(.success) { (snapshot) in
            self.imgURL = snapshot.metadata?.downloadURL()?.absoluteString
            withBlock()
        }
    }
    
    func cancelEntry(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
