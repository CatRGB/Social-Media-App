//
//  PostsListView.swift
//  SocialMediaApp
//
//  Created by Josi Salehi on 25.05.25.
//

import SwiftUI

struct PostsListView: View {
    @ObservedObject var postViewModel = PostViewModel()
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
    }
}
#Preview {
    PostsListView()
}
