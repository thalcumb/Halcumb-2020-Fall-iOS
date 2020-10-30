//
//  FirstViewController.swift
//  iOSp1
//
//  Created by Apple on 10/29/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imageSelectController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSelectController.delegate = self
        imageSelectController.allowsEditing = true
        // Do any additional setup after loading the view.
    }

    @IBAction func swipeNavMade(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            print("Swiped LEFT")
        }
        if (sender.direction == .right) {
            print("Swiped RIGHT")
            
        }
    }
    @IBAction func imageSelectButton(_ sender: Any) {
        loadNewPicture()
    }
    
    func loadNewPicture() {
            let alertController = UIAlertController(title: "Select Photo to Use", message: "Choose your photo library or use your Camera to capture the moment.", preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction(title: "Library", style: .default, handler: { (alertAction) in
            print("library")
            self.imageSelectController.sourceType = .photoLibrary
            self.present(self.imageSelectController, animated: true, completion: nil)
        }))

        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alertAction) in
            print("camera")
            if( UIImagePickerController.isSourceTypeAvailable(.camera) ){
                self.imageSelectController.sourceType = .camera
                self.present(self.imageSelectController, animated: true, completion: nil)
            }
        }))

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
            print("cancel")
        }))

        present(alertController, animated: true, completion: nil)
    }


        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let choosenImage = info[.editedImage] as! UIImage

            imageView.image = choosenImage

            dismiss(animated: true, completion: nil)
        }
    
}

