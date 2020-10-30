//
//  SecondViewController.swift
//  iOSp1
//
//  Created by Apple on 10/29/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class SecondViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var trackFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self

        locationManager.requestWhenInUseAuthorization()
        
        locationManager.distanceFilter = 10
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let currentLocation = locations.first{
//                print(currentLocation.coordinate)
                let mapRegion = MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))

                mapView.setRegion(mapRegion, animated: true)
            }
        }

    @IBAction func mapButtonSelected(_ sender: Any) {
        if (trackFlag == false) {
            trackFlag = true
            locationManager.startUpdatingLocation()
        }
        else if (trackFlag == true) {
            trackFlag = false
            locationManager.stopUpdatingLocation()
        }
        
        
    }
    
}

