//
//  TabViewExampleView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya
//

import SwiftUI

struct TabViewExampleView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            // Home Tab
            VStack(spacing: 20) {
                Image(systemName: "house.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)

                Text("Home")
                    .font(.title)
                    .fontWeight(.bold)

                Text("This is the home tab")
                    .foregroundColor(.gray)
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)

            // Search Tab
            VStack(spacing: 20) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 80))
                    .foregroundColor(.green)

                Text("Search")
                    .font(.title)
                    .fontWeight(.bold)

                Text("This is the search tab")
                    .foregroundColor(.gray)
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(1)

            // Favorites Tab
            VStack(spacing: 20) {
                Image(systemName: "heart.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.red)

                Text("Favorites")
                    .font(.title)
                    .fontWeight(.bold)

                Text("This is the favorites tab")
                    .foregroundColor(.gray)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
            .tag(2)

            // Profile Tab
            VStack(spacing: 20) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.purple)

                Text("Profile")
                    .font(.title)
                    .fontWeight(.bold)

                Text("This is the profile tab")
                    .foregroundColor(.gray)

                Text("Currently on tab: \(selectedTab)")
                    .font(.caption)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle.fill")
            }
            .tag(3)
        }
        .navigationTitle("Tab View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        TabViewExampleView()
    }
}
