//
//  ProfileHome.swift
//  Rideshare
//
//  Created by Patrick Donohoe on 3/3/23.
//

import SwiftUI

struct ProfileHome: View {
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                //.foregroundColor(.gray)
                VStack{
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 130)
                        .cornerRadius(100)
                        .padding(22)
                        .padding(.top, -80)
                }
                VStack{
                    Text("Name Here")
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                VStack{
                    Text("Preferences")
                        .font(.headline)
                        .fontWeight(.bold)
                        .offset(x: 30, y: 0)
                }
                .frame(maxWidth:.infinity, maxHeight: .infinity,
                       alignment: .leading)
            }
        }
    }
}
