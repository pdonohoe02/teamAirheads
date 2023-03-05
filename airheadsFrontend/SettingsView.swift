//
//  SettingsView.swift
//  airheadsFrontend
//
//  Created by Teresa Huang on 3/4/23.
//
import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                ProfileSettings()
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(
                trailing:
                    Button (
                        action: {
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            Text("Done")
                        }
                    )
            )
        }
    }
}
struct ProfileSettings: View {
    @AppStorage("name") var name = DefaultSettings.name
    @AppStorage("subtitle") var subtitle = DefaultSettings.subtitle
    @AppStorage("description") var description = DefaultSettings.description
    @AppStorage("gender") var gender = DefaultSettings.description
    @State private var startLocIndex = 0
    @State private var startLocSearch = ""
    @State private var endLocIndex = 0
    @State private var endLocSearch = ""
    @State private var isOrderingAhead = false
    @State private var orderDate = Date()
    @State private var orderStartTime = Date()
    @State private var orderEndTime = Date(timeIntervalSinceNow: 1800)
    var locOptions = ["Fleming House", "Computer Science majors", "Apple Users", "Avery House", "Tennis players"]
    
    var body: some View {
        Section(header: Text("Profile")) {
            Button (
                action: {
                    // Action
                },
                label: {
                    Text("Pick Profile Image")
                }
            )
            TextField("Name", text: $name)
            TextField("Subtitle", text: $subtitle)
            TextField("Gender", text: $gender)
            
            TextEditor(text: $description)
        }
        
    
        Section ("Student Groups"){
                TextField("Search valid groups",text: $startLocSearch)
                    .searchable(text: $startLocSearch, placement: .automatic)
                List {
                    ForEach(startSearchResults, id: \.self) { name in
                        Button(action: {
                            startLocSearch = name
                        }) {
                            Text(name)
                        }
                    }
                }
            }
            
        
    }
    var startSearchResults: [String] {
        if startLocSearch.isEmpty {
            return []
        } else if locOptions.contains(startLocSearch.lowercased()) {
            return []
        } else {
            return locOptions.filter { $0.contains(startLocSearch.lowercased()) }
        }
    }
    
    
    
    
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}
