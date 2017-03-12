//
//  ViewController.swift
//  6.1.1
//
//  Created by user on 9/29/1395 AP.
//  Copyright © 1395 user. All rights reserved.
//

import UIKit
import Foundation
import MapKit

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate{//, UITableViewDelegate,UITableViewDataSource{


    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    /*
    var coordinates: [[Double]]!
    var names:[String]!
    var addresses:[String]!
    var phones:[String]!
    */
    let a = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //read txt file
        if let path = Bundle.main.path(forResource: "text", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                var myArray = data.components(separatedBy: "\n")
                //Initialized to array and add annotations
                self.mapView.delegate = self
                for i in 0...4{
                let myArray1 = myArray[i].components(separatedBy: ",")
                let point = StarbucksAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(myArray1[0])! , longitude: Double(myArray1[1])! ))
                point.image = UIImage(named: "image-\(i+1).png")
                point.name = myArray1[2]
                point.address = myArray1[3]
                point.phone = myArray1[4]
                
                self.mapView.addAnnotation(point)
                
                }
    
            } catch {
                
            }
        }
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.68, longitude: 51.38), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        self.mapView.setRegion(region, animated: true)
        
    }

    //MARK: MKMapViewDelegate
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            if annotation is MKUserLocation
            {
                return nil
            }
            var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
            if annotationView == nil{
                annotationView = AnnotationView(annotation: annotation, reuseIdentifier: "Pin")
                annotationView?.canShowCallout = false
            }else{
                annotationView?.annotation = annotation
            }
            annotationView?.image = UIImage(named: "pin")
            return annotationView
        }
        
        
    
    
        func mapView(_ mapView: MKMapView,didSelect view: MKAnnotationView)
        {
            // 1
            if view.annotation is MKUserLocation
            {
                // Don't proceed with custom callout
                return
            }
            // 2
            let starbucksAnnotation = view.annotation as! StarbucksAnnotation
            let views = Bundle.main.loadNibNamed("CustomCalloutView", owner: nil, options: nil)
            let calloutView = views?[0] as! CustomCalloutView
            calloutView.name.text = starbucksAnnotation.name
            calloutView.address.text = starbucksAnnotation.address
            calloutView.phone.text = starbucksAnnotation.phone
            calloutView.image.image = starbucksAnnotation.image
            // 3
            calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
            view.addSubview(calloutView)
            mapView.setCenter((view.annotation?.coordinate)!, animated: true)
        }
        
        
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            if view.isKind(of: AnnotationView.self)
            {
                for subview in view.subviews
                {
                    subview.removeFromSuperview()
                }
            }
        }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
}
