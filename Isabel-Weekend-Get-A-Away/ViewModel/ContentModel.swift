//
//  ContentModel.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/21/22.
//

import Foundation
import CoreLocation
import SwiftUI

class ContentModel : NSObject, ObservableObject, CLLocationManagerDelegate  {
    
   
    var locationManager = CLLocationManager()
    
    @Published var resturants = [business]()
    @Published var sights = [business]()
    
    @Published var locationState = CLAuthorizationStatus.notDetermined
    override init(){
        super.init()
        
        locationManager.delegate = self
        
        //REQUEST THE USER FOR PERMISSION
       // locationManager.requestWhenInUseAuthorization()
        
    
        
    }
    func requetUIUserAutorization()
    {
        locationManager.requestWhenInUseAuthorization()
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if(locationManager.authorizationStatus == CLAuthorizationStatus.authorizedAlways || locationManager.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse)
        {
            locationManager.startUpdatingLocation()
        }
        if(locationManager.authorizationStatus == CLAuthorizationStatus.denied)
        {
            locationState = CLAuthorizationStatus.denied
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.first
        
        if(userLocation != nil)
        {
            
            locationManager.stopUpdatingLocation()
            locationState = locationManager.authorizationStatus
            
            getYelpData(category: "arts", location: userLocation!)
            getYelpData(category: "restaurants", location: userLocation!)
           
        }
        
        
    }
    
   
    
    func getYelpData(category : String,location : CLLocation )
    {
        
        //CREATE THE URL
        var urlComp = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        
        urlComp?.queryItems = [
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "limit", value: "10")
            ]
        
        let url = urlComp?.url
        
        //CREATE THE REQUEST
        if let url = url{
        
            var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("Bearer V0-vh6y14UwGlMftgWCNLJGJnMNNK0HCtvKDXdGvsBpBRqxqEWk2UmcpW-8HbHeE1K4Mtye08dHC9_t92_I-9bsoAlYyWXoUsCIP_kTdhX83CoEUT_ZXQD_xgUMVYnYx", forHTTPHeaderField: "Authorization")
            
            //CREATE THE SESSIOn
            let session = URLSession.shared
            
            //CREATE THE DATATASK
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                        
                if error == nil
                {
                  
                    do
                    {
                        let jsondecode = JSONDecoder()
                        let result = try jsondecode.decode(businessSearch.self, from: data!)
                        //INSTEAD OF THE BACKGROUND JOB TO UPDATE THE MAIN UI SET THE MAIN THREAD TO HANDLE THIS
                        
                        for b in result.businesses {
                            
                            b.getImageDataFromUrl()
                            
                        }
                        
                        
                        
                        DispatchQueue.main.async {
                            if(category == "restaurants")
                            {
                               
                                self.resturants = result.businesses
                               
                            }
                            else
                            {
                              
                                self.sights = result.businesses
                               
                            }


                        }
                        
                    }
                    catch
                    {
                        print(error)
                    }
                    
                    
                }
            }
            
            dataTask.resume()
            
        }
        
       
        //CREATE THE DATATASK
        
        
        //START THE DATATASK
        
    }
    
    
    
    
    
}
