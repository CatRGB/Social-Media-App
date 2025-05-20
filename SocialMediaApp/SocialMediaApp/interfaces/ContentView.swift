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
            VStack {
                NavigationView {
                    VStack {
                        Text("Social Media App")
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
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.bottom, 100)
                            
                            HStack {
                                Text("Sie haben noch keinen Account?")
                                NavigationLink(destination: RegisterView()) {
                                    Text("Register")
                                        .underline()
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.85))
                    .cornerRadius(15)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
