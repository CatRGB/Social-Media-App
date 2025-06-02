//
//  PostsListView.swift
//  SocialMediaApp
//
//  Created by Josi Salehi on 25.05.25.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var postViewModel = PostViewModel()
    @State private var newPostContent = ""
    
    var body: some View {
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
        HStack {
            TextField("Deine Gedanken...", text: $newPostContent)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                postViewModel.addPost(content: newPostContent)
                newPostContent = ""
            }) {
                Text("Senden")
                    .padding(.horizontal)
                    .padding(.vertical)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(9)
            }
            .padding(.trailing)
            

        }
        
    }
}

#Preview {
    PostListView()
}
