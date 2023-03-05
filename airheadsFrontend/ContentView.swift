//
//  ContentView.swift
//  Rideshare
//
//  Created by Patrick Donohoe on 3/3/23.
//
import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .requestRide
    @State private var signedIn = false
    @State private var userEmail = ""
    @State private var emailField = ""
    @State private var passwordField = ""
    @State private var signUpEmailField = ""
    @State private var signUpPasswordField = ""
    @State private var passwordConfim = ""
    @State private var signUpPassDontMatch = false
    @State private var emailNotValid = false
    @State private var invalidEmailPassword = false
    

    enum Tab {
        case requestRide
        case message
        case profile
    }
    var body: some View {
        
        if signedIn {
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
                        ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.fill")
                        }
                    .tag(Tab.profile)
            }
        } else {
            NavigationView {
                Form {
                    Section ("Sign In") {
                        TextField("Enter email",text: $emailField)
                            .autocorrectionDisabled()
                        SecureField("Enter password", text: $passwordField)
                        if emailNotValid {
                            Text("Invalid email")
                                .foregroundColor(Color.red)
                        } else if invalidEmailPassword {
                            Text("Invalid email or password")
                                .foregroundColor(Color.red)
                        }
                            
                        Button(action: {
                            if emailField == ""{
                                emailNotValid = true
                            } else {
                                emailNotValid = false
                                userInfo.email = signUpEmailField
                                signedIn = true
                            }
                        }) {
                            Text("Sign In")
                        }
                    }
                    Section ("Sign up") {
                        TextField("Enter email", text: $signUpEmailField)
                            .autocorrectionDisabled()
                        SecureField("Enter password", text: $signUpPasswordField)
                        SecureField("Confirm password", text: $passwordConfim)
                        if emailNotValid {
                            Text("Invalid email")
                                .foregroundColor(Color.red)
                        } else if signUpPassDontMatch {
                            Text("Passwords don't match")
                                .foregroundColor(Color.red)
                        }
                            
                        Button(action: {
                            if passwordField != passwordConfim {
                                signUpPassDontMatch = true
                            } else if signUpEmailField == ""{
                                emailNotValid = true
                            } else {
                                emailNotValid = false
                                signUpPassDontMatch = false
                                userEmail = signUpEmailField
                                signedIn = true
                            }
                        }) {
                            Text("Sign Up")
                        }
                    }
                }
                .navigationTitle("Ride Green")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct userInfo {
   static var email: String=""
   static var signedIn: Bool=false
}
