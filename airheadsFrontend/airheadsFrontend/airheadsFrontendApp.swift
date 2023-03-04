//
//  ContentView.swift
//  Rideshare
//
//  Created by Patrick Donohoe on 3/3/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuthUI
import FirebaseEmailAuthUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    let authUI = FUIAuth.defaultAuthUI()
    authUI.delegate = self
    let providers: [FUIAuthProvider] = [
    FUIEmailAuth(),
    ]
    //self.authUI.providers = providers
    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}
