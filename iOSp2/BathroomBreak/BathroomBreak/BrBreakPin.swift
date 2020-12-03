//
//  BrBreakPin.swift
//  BathroomBreak
//
//  Created by Tanner Halcumb on 12/2/20.
//

import UIKit
import MapKit

class BrBreakPin: NSObject, MKAnnotation {

    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D

    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
