//
//  BusinessListView.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/26/22.
//

import SwiftUI

struct BusinessListView: View {
    
    @EnvironmentObject var model : ContentModel
    
    var body: some View {
        
        ScrollView(showsIndicators: false)
        {
            LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders){
                BusinessSectionView(title: "Art", businessModel: $model.sights)
                BusinessSectionView(title: "Resturants", businessModel: $model.resturants)
              
            }
                
        }
    }
}


