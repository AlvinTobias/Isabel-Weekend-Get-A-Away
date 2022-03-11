//
//  Directions.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 3/11/22.
//

import SwiftUI
import MapKit

struct Directions : UIViewRepresentable{
    
    @EnvironmentObject var model : ContentModel
    @ObservedObject var businessModel : business
    
    var startLocation : CLLocationCoordinate2D {
        
        return model.locationManager.location?.coordinate ?? CLLocationCoordinate2D()
    }
    var endLocation : CLLocationCoordinate2D {
        
        return CLLocationCoordinate2D(latitude: businessModel.coordinates!.latitude!, longitude: businessModel.coordinates!.longitude!)
    }
    
    func makeUIView(context: Context) -> MKMapView {
    
        let map = MKMapView()
        
        map.showsUserLocation = true
        map.userTrackingMode = MKUserTrackingMode.followWithHeading
        
        map.delegate = context.coordinator
        //create a request
        var mkRequest = MKDirections.Request()
        mkRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: startLocation))
        mkRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: endLocation))
        
        //create a direction
        var mkDirection = MKDirections(request: mkRequest)
        
        
        //calculate the direction
        mkDirection.calculate { mkResponse, mkError in
            
         if mkError == nil
            {
             
             for route in mkResponse!.routes
             {
                 map.addOverlay(route.polyline)
                // map.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                 map.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
                
             }
         }
            
        }
        
        //ADD ANNOTATION FOR END POINT
        var mkAnnotation = MKPointAnnotation()
        
        
        let locationEndAnnotation = MKPointAnnotation()
        locationEndAnnotation.coordinate.latitude = businessModel.coordinates!.latitude!
        locationEndAnnotation.coordinate.longitude = businessModel.coordinates!.longitude!
        locationEndAnnotation.title = businessModel.name
        
        map.addAnnotation(locationEndAnnotation)
        
        
        return map
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        
    }
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator :NSObject,MKMapViewDelegate
    {
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            
            let render = MKPolylineRenderer(polyline: overlay as! MKPolyline)
            render.strokeColor = .systemPink
            render.lineWidth = 2
            
            return render
        }
    }
    
}
