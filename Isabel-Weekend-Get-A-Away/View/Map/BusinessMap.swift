//
//  BusinessMap.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 3/3/22.
//

import Foundation
import MapKit
import SwiftUI

struct BusinessMap : UIViewRepresentable {
    
    @EnvironmentObject var model : ContentModel
    
    var locationList:[MKPointAnnotation]
    {
        var annotation = [MKPointAnnotation]()
        
        for business in model.resturants + model.sights
        {
            let location = MKPointAnnotation()
            location.coordinate.latitude = business.coordinates!.latitude!
            location.coordinate.longitude = business.coordinates!.longitude!
            location.title = business.name
            annotation.append(location)
            
        }
        return annotation
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
        
        mapView.delegate = context.coordinator
        
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        //REMOVE ALL THE ANNOTATION
        uiView.removeAnnotations(uiView.annotations)
        
        //ADD THE ANNOTATION
        //uiView.addAnnotations(self.locationList)
        uiView.showAnnotations( self.locationList, animated: true)
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
        uiView.removeAnnotations(uiView.annotations)
    }
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator()
        
    }
    
    class Coordinator : NSObject, MKMapViewDelegate
    {
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            if annotation is MKUserLocation
            {
                return nil
            }
            
            var mkAnnotionView = mapView.dequeueReusableAnnotationView(withIdentifier: "Business")
            if mkAnnotionView == nil
            {
                mkAnnotionView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "Business")
                mkAnnotionView!.canShowCallout = true
                mkAnnotionView!.rightCalloutAccessoryView = UIButton(type: UIButton.ButtonType.detailDisclosure)
                
            }
            else
            {
                mkAnnotionView!.annotation = annotation
            }
           
            return mkAnnotionView
        }
        
        
    }
    
    
}
