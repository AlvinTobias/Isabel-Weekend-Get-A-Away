//
//  BusinessDetail.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/28/22.
//

import SwiftUI

struct BusinessDetail: View {
    @ObservedObject var businessModel : business
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            
            VStack(alignment: .leading, spacing: 0)
            {
                GeometryReader(){
                    geo in
                    
                    let imageData = UIImage(data: businessModel.imageData ?? Data())
                    Image(uiImage: imageData ?? UIImage())
                        .resizable().scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
                ZStack
                {
                    Rectangle().frame(height: 36)
                        .foregroundColor(businessModel.isclosed! ? .gray : .green)
                    Text(businessModel.isclosed! ? "Closed" : "Open").foregroundColor(.white).bold()
                }
                   
            }
            .ignoresSafeArea()
            Text(businessModel.name!).bold().font(.title2)
            Group
            {
                VStack(alignment: .leading)
                {
                    HStack
                    {
                        
                        //ADDD
                        VStack(alignment: .leading)
                        {
                            
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
                                HStack
                                {
                                    Text("\(businessModel.location!.city!)").font(.caption)
                                    Text("\(businessModel.location!.state!)").font(.caption)
                                    Text("\(businessModel.location!.country!)").font(.caption)
                                    
                                    
                                }
                            }
                            
                        }
                        //YELP IMAGE
                        
                        
                    }
                    
                    Image("regular_\(businessModel.rating!)")
                    
                    Divider()
                    //Phone
                    HStack
                    {
                        Text(businessModel.displayphone!)
                        Spacer()
                        Link("Call",
                             destination: URL(string: "tel:\(businessModel.phone ?? "")")!)
                    }
                    .padding()
                    Divider()
                    //REview Count
                    HStack
                    {
                        Text(String(businessModel.reviewcount ?? 0))
                        Spacer()
                        Link("Read",
                             destination: URL(string: "\(businessModel.url ?? "")")!)
                    }
                    .padding()
                    Divider()
                    //Website
                    HStack
                    {
                        Text(businessModel.url ?? "").lineLimit(1)
                        Spacer()
                        Link("Website",
                             destination: URL(string: "\(businessModel.url ?? "")")!)
                    }
                    .padding()
                    //Button
                    
                    Button {
                        
                    } label: {
                        
                        ZStack
                        {
                            Rectangle().frame(height: 48)
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                            Text("Get Direction").foregroundColor(.white).bold()
                        }
                        .padding()
                      
                    }

                    
                    
                }
            }
            
            
        }
        
        
        
    }
}

