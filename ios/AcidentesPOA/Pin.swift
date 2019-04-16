//
//  Pin.swift
//  AcidentesPOA
//
//  Created by Augusto Boranga on 15/04/19.
//  Copyright © 2019 com. All rights reserved.
//

import Foundation
import MapKit

class Pin: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(_ coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = nil
        super.init()
    }
    
}
