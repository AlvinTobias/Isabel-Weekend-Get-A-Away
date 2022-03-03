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
        
        
    }
    
    
    
}
