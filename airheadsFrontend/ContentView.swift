//
//  ContentView.swift
//  Rideshare
//
//  Created by Patrick Donohoe on 3/3/23.
//

import SwiftUI


struct ContentView: View {
    @State private var selection: Tab = .requestRide
    enum Tab {
        case requestRide
        case message
        case profile
    }

    var body: some View {
        
        TabView(selection: $selection) {
            RequestRideHome()
                .tabItem {
                    Label("Request Ride", systemImage: "car.fill")
                }
                .tag(Tab.requestRide)

            MessageHome()
                .tabItem {
                    Label("Message", systemImage: "message.fill")
                }
                .tag(Tab.message)
            ProfileHome()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(Tab.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
