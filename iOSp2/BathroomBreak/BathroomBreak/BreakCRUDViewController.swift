//
//  BreakCRUDViewController.swift
//  BathroomBreak
//
//  Created by Tanner Halcumb on 12/2/20.
//

import UIKit
import CoreData
import MapKit

class BreakCRUDViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var categoryTextField: UITextField!
    
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func saveBreak(_ sender: Any) {
        let currentLocation = LocationController.currentLocation
//        print(currentLocation?.coordinate.longitude)
//        print(currentLocation?.coordinate.latitude)
        BathroomBreakController.createBreak(newName: nameTextField.text!,
                                            newDescription: descriptionText.text!,
                                            newLongitude: (currentLocation?.coordinate.longitude)! as Double,
                                            newLatitude: (currentLocation?.coordinate.latitude)! as Double)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let currentLocation = LocationController.currentLocation
        
        let mapRegion = MKCoordinateRegion(center: currentLocation!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        mapView.setRegion(mapRegion, animated: true)
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
