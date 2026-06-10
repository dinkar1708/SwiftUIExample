//
//  AsyncAwaitView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya
//

import SwiftUI

// MARK: - Data Model
@available(iOS 15.0, *)
struct Post: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

// MARK: - Network Service
@available(iOS 15.0, *)
class NetworkService {
    static let shared = NetworkService()

    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let posts = try JSONDecoder().decode([Post].self, from: data)
        return Array(posts.prefix(10)) // Return only first 10 posts
    }
}

// MARK: - View Model
@available(iOS 15.0, *)
@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadPosts() async {
        isLoading = true
        errorMessage = nil

        do {
            // Simulate network delay
            try await Task.sleep(nanoseconds: 1_000_000_000)
            posts = try await NetworkService.shared.fetchPosts()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}

// MARK: - Async/Await View
@available(iOS 15.0, *)
struct AsyncAwaitView: View {
    @StateObject private var viewModel = PostsViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                VStack(spacing: 20) {
                    ProgressView()
                        .scaleEffect(1.5)
                    Text("Loading posts...")
                        .foregroundColor(.gray)
                }
            } else if let errorMessage = viewModel.errorMessage {
                VStack(spacing: 20) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.red)

                    Text("Error")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text(errorMessage)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()

                    Button("Retry") {
                        Task {
                            await viewModel.loadPosts()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            } else if viewModel.posts.isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "tray")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)

                    Text("No posts loaded")
                        .font(.title2)
                        .foregroundColor(.gray)

                    Button("Load Posts") {
                        Task {
                            await viewModel.loadPosts()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            } else {
                List(viewModel.posts) { post in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(post.title)
                            .font(.headline)
                            .lineLimit(2)

                        Text(post.body)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(3)
                    }
                    .padding(.vertical, 4)
                }
                .refreshable {
                    await viewModel.loadPosts()
                }
            }
        }
        .navigationTitle("Async/Await")
        .toolbar {
            if !viewModel.posts.isEmpty {
                Button("Refresh") {
                    Task {
                        await viewModel.loadPosts()
                    }
                }
            }
        }
        .task {
            if viewModel.posts.isEmpty {
                await viewModel.loadPosts()
            }
        }
    }
}

#Preview {
    if #available(iOS 15.0, *) {
        NavigationView {
            AsyncAwaitView()
        }
    } else {
        Text("Requires iOS 15+")
    }
}
