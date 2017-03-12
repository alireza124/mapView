//
//  StarbucksAnnotation.swift
//  6.1.1
//
//  Created by user on 11/17/1395 AP.
//  Copyright © 1395 user. All rights reserved.
//

import Foundation
import MapKit

class StarbucksAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var phone: String!
    var name: String!
    var address: String!
    var image : UIImage!
    
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
