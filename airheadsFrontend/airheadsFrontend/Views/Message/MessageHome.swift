//
//  ProfileHome.swift
//  Rideshare
//
//  Created by Patrick Donohoe on 3/3/23.
//
import SwiftUI
import Foundation

struct MessageHome: View {
    //@State private var selectedFlavor: Flavor = .chocolate
    @State private var startLocIndex = 0
    @State private var newMessage = ""
    @State private var agreementText = ""
    @State private var userAgreed = true
    @State private var user = "Patrick"
    
    var locOptions = ["campus", "pavs", "airport", "razzmataz", "opium"] // get from server
    // list sorted by time of chat messages
    var chatMessageDict = ["Patrick", "photoURL", "dummy"]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    List {
                        ForEach(DailyScrum.sampleData) { entry in
                            ZStack {
                                if entry.title == user {
                                    GroupBox(label:Label(entry.title, systemImage:"building.columns")) {
                                        Text(entry.attendees)
                                    }
                                    .opacity(0.75)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.green))
                                } else {
                                    GroupBox(label:Label(entry.title, systemImage:"building.columns")) {
                                        Text(entry.attendees)
                                    }
                                    .opacity(0.75)
                                }
                            }
                            
                        }
                    }
                    
                }

    //            .frame(height:600, alignment:.topLeading)
    //            .padding(.top, -80)
                Section {
                    TextField("Type message",text: $newMessage)
                    Button(action: {
                        print("submit form")
                    }) {
                        Text("Send Message")
                    }
                }
            }
            
            //.frame(height: 100, alignment: .topTrailing)
            .navigationTitle("Message")
        }
        
    }
}


//                for name in chatMessageDict {
//                    Text(name)
//                }
//                GroupBox(label:
//                        Label("End-User Agreement", systemImage: "building.columns")
//                    ) {
//                        ScrollView(.vertical, showsIndicators: true) {
//                            Text(agreementText)
//                                .font(.footnote)
//                        }
//                        .frame(height: 100)
//                        Toggle(isOn: $userAgreed) {
//                            Text("I agree to the above terms")
//                        }
//                    }
//List {
//    chatMessageDict.forEach{entry in
//        Text(entry)
//    }
//
//}
/*
See LICENSE folder for this sample’s licensing information.
*/



struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: String
    var lengthInMinutes: Int
    
    init(id: UUID = UUID(), title: String, attendees: String, lengthInMinutes: Int) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Patrick", attendees: "Thanks for ridesharing with me!", lengthInMinutes: 10),
        DailyScrum(title: "Patrick", attendees: "Can't believe we rode in an electric car", lengthInMinutes: 10),
        DailyScrum(title: "Donohoe", attendees: "We were absolutely posted", lengthInMinutes: 10),
        DailyScrum(title: "Patrick", attendees: "Saved so much gas", lengthInMinutes: 10)
//        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10),
//        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
//        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5)
    ]
}
