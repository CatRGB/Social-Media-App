//
//  SocialMediaAppApp.swift
//  SocialMediaApp
//
//  Created by Josi Salehi on 20.05.25.
//

import SwiftUI
import Firebase

@main
struct SocialMediaAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
