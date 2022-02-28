//
//  BusinessModel.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/27/22.
//

import Foundation
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
