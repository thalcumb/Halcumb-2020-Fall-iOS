//
//  LocationController.swift
//  BathroomBreak
//
//  Created by Tanner Halcumb on 12/2/20.
//

import Foundation
import CoreLocation

class LocationController: NSObject, CLLocationManagerDelegate {
    
    static let locationManager:CLLocationManager = CLLocationManager()
    
    static var currentLocation:CLLocation? = nil
    
    static var sharedLocationController:LocationController = LocationController()
    
    
    class func startGPS() {
        locationManager.delegate = sharedLocationController
        locationManager.distanceFilter = 10
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }
    
    class func stopGPS() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.first
//        print(currentLocation)
        LocationController.currentLocation = currentLocation

    }
    
}
