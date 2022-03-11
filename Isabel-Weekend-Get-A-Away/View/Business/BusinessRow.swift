//
//  BusinessRow.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/27/22.
//

import SwiftUI


struct BusinessRow: View {
    
    @ObservedObject var businessModel : business
    
    var body: some View {
        
        NavigationLink {
            BusinessDetail(businessModel: businessModel, directionview: false)
        } label: {
            HStack{
                
                //IMAGE
                let imageData = UIImage(data: businessModel.imageData ?? Data())
                Image(uiImage: imageData ?? UIImage()).resizable().frame(width: 58, height: 58).scaledToFit().cornerRadius(10)
                    .padding(3)
                
                //
                VStack(alignment: .leading)
                {
                    Text(businessModel.name ?? "").bold()
                    
                    Text(String(format: "%.1f km away", (businessModel.distance ?? 0)/1000))
                        .font(.caption)
                   
                    //Distance
                }.padding([.leading,.trailing],3)
                Spacer()
                //REview Start
                VStack(alignment: .leading)
                {
                    Image("regular_\(businessModel.rating!)")
                    Text("Based on ").font(.caption)
                    Text("\(businessModel.reviewcount!) Reviews" ).font(.caption)
                }
                .padding([.leading,.trailing],3)
                //REview Counts
                
            }
        }

        
       
    }
}


