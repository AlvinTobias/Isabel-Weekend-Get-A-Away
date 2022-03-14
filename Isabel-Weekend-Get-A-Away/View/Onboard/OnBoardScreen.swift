//
//  OnBoardScreen.swift
//  Isabel-Weekend-Get-A-Away
//
//  Created by Jainy Alvin on 3/14/22.
//

import SwiftUI

struct OnBoardScreen: View {
    
    @State var onBoardingSelection = 0
    @EnvironmentObject var model : ContentModel
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 176/255)
    private let turquiose = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    
    var body: some View {
        
        VStack
        {
            TabView(selection: $onBoardingSelection) {
                VStack {
                    Image("city2").resizable().scaledToFit()
                    Text("Welcome to Isabel Get A Away!").font(.title3).bold()
                    Text("We help you to enjoy your weekend in your city!").font(.caption)
                }
                .tag(0)
                
                VStack {
                    Image("city1").resizable().scaledToFit()
                    Text("Ready to discover your city!").font(.title3).bold()
                    Text("We will show you the best restuarants,venues and more,based on your location.!").font(.caption).multilineTextAlignment(.center)
                }
                .tag(1)
                
            }
            .foregroundColor(.white)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
            Button {
                
                if onBoardingSelection == 0
                {
                    onBoardingSelection = 1
                }
                else
                {
                    model.requetUIUserAutorization()
                }
                
            } label: {
                ZStack
                {
                    Rectangle().frame(height: 48).foregroundColor(.white).cornerRadius(10)
                    Text(onBoardingSelection == 0 ? "Next":"Get My Location").foregroundColor(onBoardingSelection == 0 ? blue:turquiose).bold().font(.title2)
                }
                .padding(.all, 50.0)
            }
           
        }
        .background(onBoardingSelection == 0 ? blue:turquiose)
      
        
        
        
    }
}

struct OnBoardScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardScreen()
    }
}
