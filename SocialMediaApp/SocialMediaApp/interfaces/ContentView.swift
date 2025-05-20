//
//  ContentView.swift
//  SocialMediaApp
//
//  Created by Josi Salehi on 20.05.25.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var isLoggedIn = Auth.auth().currentUser != nil
    
    var body: some View {
        if isLoggedIn {
            //MainView()
        } else {
            NavigationView {
                VStack {
                    Text("Scial Media App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: LoginView()) {
                            Text("Login")
                                .frame(maxWidth: 200)
                                .padding()
                                .background(Color.blue)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        NavigationLink(destination: RegisterView()) {
                            Text("Registerierung")
                                .frame(maxWidth: 200)
                                .padding()
                                .background(Color.blue)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.bottom, 300)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
