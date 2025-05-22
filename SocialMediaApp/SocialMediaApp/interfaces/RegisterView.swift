//
//  RegisterView.swift
//  SocialMediaApp
//
//  Created by Josi Salehi on 20.05.25.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
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
                Text("Register")
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
                
                Button(action: register) {
                    Text("Registrieren")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
    private func register() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
            }
            print("User created!")
        }
    }
}

#Preview {
    RegisterView()
}
