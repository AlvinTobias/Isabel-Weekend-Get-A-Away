//
//  BusinessSectionHeader.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/26/22.
//

import SwiftUI

struct BusinessSectionHeader: View {
    @State var title : String
    var body: some View {
       
        ZStack(alignment: .leading)
            {
                Rectangle().foregroundColor(.white)
                Text(title).bold().font(.title3)
                
                  
            }
           
        
    }
}


