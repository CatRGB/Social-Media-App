//
//  UserSession.swift
//  SocialMediaApp
//
//  Created by Josi Salehi on 22.05.25.
//

import Foundation
import FirebaseAuth

// Die Klasse ist dafür da um zuschauen ob User schon eingelogt wahren oder sind
class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = Auth.auth().currentUser != nil
}
