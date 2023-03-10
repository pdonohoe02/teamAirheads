

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
                        .offset(x: 0, y: -100)
                }
                AsyncImage(url: URL(string: "https://example.com/icon.png"))
                    .frame(width: 200, height: 200)
                    .offset(x: 0, y: -50)
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)

                VStack{
                    Text("Preferences")
                        .font(.headline)
                        .fontWeight(.bold)
                        .offset(x: -125, y: 0)
                }
                Menu("Student Group")
                    {
                    Text("Fleming House")
                    Text("Avery House")
                    Text("Bechtel")
                }
                    .offset(x: 20, y: 0)
                
                
                .toolbar {
                            
                            EditButton()
                        }
                
                .frame(maxWidth:.infinity, maxHeight: .infinity,
                       alignment: .leading)
                
                
                
                
            }
        }
    }
}
