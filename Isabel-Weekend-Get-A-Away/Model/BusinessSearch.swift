//
//  BusinessSearch.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/25/22.
//

import Foundation
import CoreLocation
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

struct business: Decodable, Identifiable
{
    var id : String?
    var alias : String?
    var name : String?
    var image_url: String?
    var is_closed : Bool?
    var url: String?
    var review_count : Int64?
    var rating : Double?
    var transactions: [String]?
    var categories : [Category]?
    var coordinates : Coordinate?
    var location : Location?
    var phone : String?
    var display_phone : String?
    var distance : Double?
}

struct Category: Decodable
{
    var alias: String?
    var title: String?
            
}

struct Coordinate: Decodable
{
    var latitude : Double?
    var longitude : Double?
    
}
struct Location: Decodable
{
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zip_code: String?
    var country: String?
    var state: String?
    var display_address :[String]?
    
}


