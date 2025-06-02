//
//  PostsListView.swift
//  SocialMediaApp
//
//  Created by Josi Salehi on 25.05.25.
//

import SwiftUI

struct PostsListView: View {
    // Objekt holen wo die posts drine sind
    @ObservedObject var postViewModel = PostViewModel()
    @State var newPostContet = ""
    
    var body: some View {
        // Posts aufrufen und in einer Liste anzuzeigen
        List(postViewModel.posts) { post in
            VStack(alignment: .leading) {
                Text(post.author).font(.headline)
                Text(post.content).font(.subheadline)
                Text("\(post.timestamp.dateValue())")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Beiträge")
        
        VStack(spacing: 20) {
            TextField("Teile deine Gedanken mit...", text: $newPostContet)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                postViewModel.addPosts(content: newPostContet)
                newPostContet = ""
            }) {
                Text("Veröffentlichen")
                    .padding(.horizontal)
                    .padding(.vertical)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(7)
            }
        }
    }
}
#Preview {
    PostsListView()
}
