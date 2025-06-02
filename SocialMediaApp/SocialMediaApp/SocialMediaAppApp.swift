//
//  SocialMediaAppApp.swift
//  SocialMediaApp
//
//  Created by Josi Salehi on 20.05.25.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

@main
struct SocialMediaAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var session = UserSession()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(session)
        }
    }
}

/// Abildung der Datenban struktur
struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    var author: String
    var content: String
    var timestamp: Timestamp
}

/// Update bekommen
class PostViewModel: ObservableObject {
    @Published var posts = [Post]()
    private var db = Firestore.firestore()
    
    init() {
        fetchPosts()
    }
    
    /// Schaut in der Datenbank Post nach hinhatlten und sortiert diese nach dem Timestemp.
    /// Es wird sichergestellt das Daten vorhanden sind ansonsten wird abgebrochen
    func fetchPosts() {
        db.collection("posts").order(by: "timestamp", descending: true).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Keine Posts in der Datenbank gefunden")
                return
            }
            self.posts = documents.compactMap { queryDocumentSnapshot in
                try? queryDocumentSnapshot.data(as: Post.self)
            }
        }
    }
    
    func addPosts(content: String) {
        guard let usermail = Auth.auth().currentUser?.email else { return }
        let newPost = Post(author: usermail, content: content, timestamp: Timestamp())
        do {
            _ = try db.collection("posts").addDocument(from: newPost)
        }
        catch let error {
            print("Fehler: \(error.localizedDescription)")
        }
        
    }
}
