//
//  BusinessMapDirection.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 3/10/22.
//

import SwiftUI

struct BusinessMapDirection: View {
    
    @ObservedObject var businessModel : business
    
    var body: some View {
        
        VStack
        {
            
            //ADDD
            VStack(alignment: .leading)
            {
                HStack
                {
                    Text(businessModel.name!).bold().font(.title2)
                        .foregroundColor(.black)
                        
                    Spacer()
                    if let lat = businessModel.coordinates?.latitude , let lon = businessModel.coordinates?.longitude,let nametitle = businessModel.name
                    {
                       let title = nametitle.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                        
                        Link("Open in Map", destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(lon)&q=\(title!)")!)
                        
                    }
                }
               
                if(businessModel.location != nil)
                {
                    
                       
                        HStack
                        {
                            if(businessModel.location?.address1 != "" && businessModel.location?.address1 != nil)
                            {
                                Text("\(businessModel.location!.address1!)").font(.caption)
                            }
                            if(businessModel.location?.address2 != "" && businessModel.location?.address2 != nil)
                            {
                                Text(",\(businessModel.location!.address2!)").font(.caption)
                            }
                            if(businessModel.location?.address3 != "" && businessModel.location?.address3 != nil)
                            {
                                Text(",\(businessModel.location!.address3!)").font(.caption)
                            }
                        }
                        .foregroundColor(.black)
                        HStack
                        {
                            Text("\(businessModel.location!.city!)").font(.caption)
                            Text("\(businessModel.location!.state!)").font(.caption)
                            Text("\(businessModel.location!.country!)").font(.caption)
                            
                            
                        }
                        .foregroundColor(.black)
                    
                    }
                Image("regular_\(businessModel.rating!)")
                
              
                
            }
            .padding()
           
            Directions(businessModel: businessModel).ignoresSafeArea()
            
        }
        
    }
}


