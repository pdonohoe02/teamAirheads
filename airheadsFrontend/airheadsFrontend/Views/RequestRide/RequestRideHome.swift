//  ProfileHome.swift
//  Rideshare
//
//  Created by Patrick Donohoe on 3/3/23.
//

import SwiftUI

//enum Flavor: String, CaseIterable, Identifiable {
//    case chocolate, vanilla, strawberry
//    var id: Self { self }
//}



struct RequestRideHome: View {
    //@State private var selectedFlavor: Flavor = .chocolate
    @State private var startLocIndex = 0
    @State private var endLocIndex = 0
    @State private var isOrderingAhead = false
    @State private var orderDate = Date()
    @State private var orderStartTime = Date()
    @State private var orderEndTime = Date()
    var locOptions = ["campus", "pavs", "airport", "razzmataz", "opium"] // get from server
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Picker(selection: $startLocIndex,  label: Text("Starting Location")) {
                        ForEach(0 ..< locOptions.count) {
                            Text(self.locOptions[$0])
                        }
                    }
                    Picker(selection: $endLocIndex,  label: Text("End Location")) {
                        ForEach(0 ..< locOptions.count) {
                            Text(self.locOptions[$0])
                        }
                    }
                }
                Section {
                    Toggle("Order Ahead", isOn: $isOrderingAhead)
                    if isOrderingAhead {
                        DatePicker(
                                "Order Date",
                                selection: $orderDate,
                                displayedComponents: [.date]
                            )
                        DatePicker(
                                "Order Start Time",
                                selection: $orderStartTime,
                                displayedComponents: [.hourAndMinute]
                            )
                    }
                    DatePicker(
                            "Order End Time",
                            selection: $orderEndTime,
                            displayedComponents: [.hourAndMinute]
                        )
                }
                
                Section {
                    Button(action: {
                        print("submit form")
                    }) {
                        Text("Request a ride")
                    }
                }
                
            }
            
            .navigationTitle("Request a Ride")
        }
    }
}

