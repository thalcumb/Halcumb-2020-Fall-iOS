//
//  MapViewController.swift
//  BathroomBreak
//
//  Created by Tanner Halcumb on 12/2/20.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let brBreaks = BathroomBreakController.breakList()
        
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        
        let currentLocation = LocationController.currentLocation
        
        let mapRegion = MKCoordinateRegion(center: currentLocation!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        mapView.setRegion(mapRegion, animated: true)
        
        
        for brBreak in brBreaks {
            
            if(brBreak.breakLat != nil){

            
//                print(brBreak.breakLat)
//                print(brBreak.breakLong)
//                print(brBreak.breakName)
//                print(brBreak.breakDescription)
                let coordinate = CLLocationCoordinate2DMake(brBreak.breakLat as Double, brBreak.breakLong as Double)
            
                let mapPin = BrBreakPin(title: brBreak.breakName!, subtitle: brBreak.breakDescription!, coordinate: coordinate)
                mapView.addAnnotation(mapPin)
                
        
            }
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
