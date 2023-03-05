//  ProfileHome.swift
//  Rideshare
//
//  Created by Patrick Donohoe on 3/3/23.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase

//enum Flavor: String, CaseIterable, Identifiable {
//    case chocolate, vanilla, strawberry
//    var id: Self { self }
//}

struct RequestRideHome: View {
    //@State private var selectedFlavor: Flavor = .chocolate
    @State private var startLocIndex = 0
    @State private var endLocIndex = 0
    @State private var isOrderingAhead = false

    @State private var contact = ""
    @State private var orderDate = Date()
    @State private var orderStartTime = Date()
    @State private var orderEndTime = Date()
    @State private var match = ""
    @State private var tried = false
    
    var locOptions = ["campus", "pavs", "airport", "razzmataz", "opium"] // get from server
    var ref: DatabaseReference = Database.database().reference()
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("How would you like to be contacted?", text: $contact)
                }
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
                        tried = true
                        self.ref.child("rides").child(String(startLocIndex)).child(String(endLocIndex)).getData(completion:  { error, snapshot in
                          guard error == nil else {
                            print(error!.localizedDescription)
                            return;
                          }
                          let userName = snapshot?.value as? String ?? "";
                            print(userName)
                            if(userName != "") {
                                match = userName
                            }
                            else{
                                match = ""
                                self.ref.child("rides").child(String(startLocIndex)).child(String(endLocIndex)).setValue(contact)
                            }
                        });
                    }) {
                        Text("Request a ride")
                    }
                }
                Section {
                    VStack {
                        if match != "" {
                            Text("Found you a match! Reach out to \(match) and save some gas!")
                        }
                        else {
                            if(tried) {
                                Text("Looks like nobody else is going there yet, but hopefully someone will reach out soon!")
                            }
                        }
                    }
                }
                
            }
            
            .navigationTitle("Request a Ride")
        }
    }
}

