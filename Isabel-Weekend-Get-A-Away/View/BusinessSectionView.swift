//
//  BusinessSectionView.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/26/22.
//

import SwiftUI

struct BusinessSectionView: View {
    var title : String
    @Binding var businessModel : [business]
    
   
    
    var body: some View {
        Section(header: BusinessSectionHeader(title: title))
        {
            
            ForEach(businessModel){
                Sit in
           
                
                BusinessRow(businessModel: Sit)
                
                Divider()
            }
        }
       
    }
}


