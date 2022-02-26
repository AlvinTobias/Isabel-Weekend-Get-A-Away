//
//  ContentView.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 2/21/22.
//

import SwiftUI
import CoreLocation
struct Launch: View {
@EnvironmentObject var model : ContentModel
var body: some View {
        if model.locationState == CLAuthorizationStatus.notDetermined
        {
            
        }
        else if model.locationState == CLAuthorizationStatus.authorizedAlways ||
                    model.locationState == CLAuthorizationStatus.authorizedWhenInUse
        {
            HomeView()
        }
        else
        {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Launch()
    }
}
