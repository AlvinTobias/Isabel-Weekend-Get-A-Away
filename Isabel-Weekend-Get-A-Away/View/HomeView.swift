//
//  HomeView.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/26/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : ContentModel
    @State var IsMappView : Bool = false
    
    var body: some View {
        NavigationView
        {
        
            if model.resturants.count != 0 && model.sights.count != 0
            {
                VStack
                {
                    HStack
                    {
                        if IsMappView == false
                        {
                            Image(systemName: "mapping")
                            Text("Randolph,NJ").bold().font(.title3)
                            Spacer()
                            Text("Switch To Map Vew").foregroundColor(.blue).font(.headline).opacity(0.8)
                        }
                        else
                        {
                            Text("Switch To List Vew").foregroundColor(.blue).font(.headline).opacity(0.8)
                        }
                    }
                    Divider()
                    if IsMappView == false
                    {
                        BusinessListView()
                    }
                }
                .foregroundColor(.black)
                .navigationBarHidden(true)
                
               
            }
            else
            {
                ProgressView()
            }
        }
    }
    
}

