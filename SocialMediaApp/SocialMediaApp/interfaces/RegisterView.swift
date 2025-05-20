//
//  RegisterView.swift
//  SocialMediaApp
//
//  Created by Josi Salehi on 20.05.25.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    var body: some View {
        VStack (spacing: 20) {
            Text("Regestrieren")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Spacer()
            
            VStack(spacing: 20) {
                TextField("Email", text: .constant(""))
                TextField("Password", text: .constant(""))
            }
            .padding(.leading, 20)
            .padding(.bottom, 250)
            
            
            Button("Regestrerieren") {
                
            }
            .foregroundColor(Color.white)
            .frame(width: 150, height: 50)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.bottom, 100)
        }
    }
}
#Preview {
    RegisterView()
}
