//
//  DeniedView.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 3/14/22.
//

import SwiftUI

struct DeniedView: View {
    let backgroundColorDenied = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        
        VStack
        {
            
            ZStack
            {
                Rectangle()
                VStack
                {
                    Text("Whoops!").font(.title).bold().padding()
                    Text("We need to access your locationto provide you with the best sights in the city.You can change your descision at any time in Settings.")
                        .multilineTextAlignment(.center).font(.callout)
                    
                    Button {
                        
                        if let urlSetting = URL(string: UIApplication.openSettingsURLString)
                        {
                            if UIApplication.shared.canOpenURL(urlSetting)
                            {
                                UIApplication.shared.open(urlSetting, options: [:], completionHandler: nil)
                            }
                        }
                    } label: {
                        ZStack
                        {
                            Rectangle().frame(height: 48).cornerRadius(10)
                            Text("Go To My Settings").foregroundColor(backgroundColorDenied).bold().font(.title2)
                        }
                        .padding(.all, 50.0)
                        .foregroundColor(.white)
                        
                    }
                }
                .foregroundColor(.white)
                 
            }
            .foregroundColor(backgroundColorDenied)
            .ignoresSafeArea()
              
        }
        
    }
    
}

struct DeniedView_Previews: PreviewProvider {
    static var previews: some View {
        DeniedView()
    }
}
