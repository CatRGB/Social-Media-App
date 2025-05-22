//
//  LoginView.swift
//  SocialMediaApp
//
//  Created by Josi Salehi on 20.05.25.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject var session: UserSession
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        ZStack {
            Image("LoginBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            
            VStack (spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 100)
                
                VStack(spacing: 20) {
                    TextField("E-Mail Adresse", text: $email)
                        .frame(maxWidth: 360, maxHeight: 40)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    SecureField("Passwort", text: $password)
                        .frame(maxWidth: 400, maxHeight: 40)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .padding()
                }
                
                Button(action: login) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Social Media App"), message: Text(alertMessage), dismissButton: .default(Text("OK"), action: { session.isLoggedIn = true }))
                }
            }
        }
    }
    
    private func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                alertMessage = "Anmeldung erfolgreich"
                showAlert = true
                errorMessage = ""
            }
        }
    }
}
#Preview {
    LoginView()
}
