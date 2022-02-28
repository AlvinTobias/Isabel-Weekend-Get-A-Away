//
//  BusinessSearch.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/25/22.
//

import Foundation
import CoreLocation
import SwiftUI

struct businessSearch : Decodable
{
    var businesses = [business]()
     var total = 0
    var region =  Region()
    
    
}

struct Region: Decodable
{
    var center = Coordinate()
}


class business:Identifiable ,ObservableObject , Decodable
{
   
    //@Published
    
    
    var id : String?
    var alias : String?
    var name : String?
    var imageurl: String?
    var isclosed : Bool?
    var url: String?
    var reviewcount : Int64?
    var rating : Double?
    var transactions: [String]?
    var categories : [Category]?
    var coordinates : Coordinate?
    var location : Location?
    var phone : String?
    var displayphone : String?
    var distance : Double?

    //@Published
    @Published var imageData: Data?
    
    enum CodingKeys: String, CodingKey
    {
        
        case imageurl = "image_url"
        case isclosed = "is_closed"
        case reviewcount = "review_count"
        case displayphone = "display_phone"
        
        case id
        case alias
        case name
        case url
        case rating
        case transactions
        case categories
        case coordinates
        case location
        case phone
        case distance
    }
    
   
   
    
    
    func getImageDataFromUrl()
    {
        //GET THE URL
        guard imageurl != nil else
        {
            return
        }

        let urlPath = URL(string: imageurl!)

        let urlSession = URLSession.shared

        //GET THE SSESSION
        let datatask = urlSession.dataTask(with: urlPath!) { data, response, error in

            if error != nil
            {
                return
            }

            DispatchQueue.main.async {
                self.imageData = data!
            }



        }
        datatask.resume()

    }
    
    
    
}

struct Category: Decodable
{
    var alias: String?
    var title: String?
            
    enum Codingkeys: String, CodingKey
    {
        case alias
        case title
    }
    
}

struct Coordinate: Decodable
{
    var latitude : Double?
    var longitude : Double?
    
    enum Codingkeys: String, CodingKey
    {
        case latitude
        case longitude
    }
    
}
struct Location: Decodable
{
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zipcode: String?
    var country: String?
    var state: String?
    var displayaddress :[String]?
    
    enum Codingkeys: String, CodingKey
    {
        case zipcode = "zip_code"
        case displayaddress = "display_address"
        
        case address1
        case address2
        case address3
        case city
    
        case country
        case state
      
    }
    
}


