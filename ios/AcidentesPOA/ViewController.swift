//
//  ViewController.swift
//  AcidentesPOA
//
//  Created by Augusto Boranga on 15/04/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locations = [CLLocationCoordinate2D]()
    let repository = DataRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locations = repository.get()
        mapView.delegate = self
        
        centerOnPoa()
        putPinsOnMap()
    }
    
    // MARK: - Map functions
    
    func centerOnPoa() {
        let rsCenter = CLLocationCoordinate2D(latitude: -30.0299596, longitude: -51.2395647)
        let region = MKCoordinateRegion(center: rsCenter, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
    }
    
    func putPinsOnMap() {
        mapView.removeAnnotations(mapView.annotations)

        for location in locations {
            let pin = Pin(location)
            mapView.addAnnotation(pin)
        }
        
        print(mapView.annotations.count, "pins")
    }

}

// MARK: - Map View Delegate methods

extension ViewController: MKMapViewDelegate {
 
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        
//        if let annotation = annotation as? Pin {
//            let identifier = "pin"
//            var view: MKAnnotationView
//            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
//                dequeuedView.annotation = annotation
//                view = dequeuedView
//            } else {
//                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//                view.canShowCallout = false
//            }
//            return view
//        }
//        return nil
//    }
    
}
