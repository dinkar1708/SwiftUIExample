//
//  GridLayoutView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya
//

import SwiftUI

struct GridLayoutView: View {
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, Color(red: 0, green: 0.7, blue: 0.9), Color(red: 0.3, green: 0.2, blue: 0.7), Color(red: 0.4, green: 0.9, blue: 0.7), Color(red: 0.2, green: 0.7, blue: 0.7), Color(red: 0.6, green: 0.4, blue: 0.2)]

    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 100))
    ]

    let fixedColumns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]

    let flexibleColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // Adaptive Grid
                VStack(alignment: .leading) {
                    Text("Adaptive Grid")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    Text("Fits as many columns as possible")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal)

                    LazyVGrid(columns: adaptiveColumns, spacing: 15) {
                        ForEach(colors, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [color.opacity(0.6), color], startPoint: .top, endPoint: .bottom))
                                .frame(height: 100)
                        }
                    }
                    .padding(.horizontal)
                }

                Divider()

                // Fixed Grid
                VStack(alignment: .leading) {
                    Text("Fixed Grid")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    Text("Columns have fixed width")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal)

                    LazyVGrid(columns: fixedColumns, spacing: 15) {
                        ForEach(colors, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [color.opacity(0.6), color], startPoint: .top, endPoint: .bottom))
                                .frame(height: 100)
                        }
                    }
                    .padding(.horizontal)
                }

                Divider()

                // Flexible Grid
                VStack(alignment: .leading) {
                    Text("Flexible Grid")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    Text("Columns share available space equally")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal)

                    LazyVGrid(columns: flexibleColumns, spacing: 15) {
                        ForEach(colors, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [color.opacity(0.6), color], startPoint: .top, endPoint: .bottom))
                                .frame(height: 100)
                        }
                    }
                    .padding(.horizontal)
                }

                Divider()

                // Horizontal Grid (LazyHGrid)
                VStack(alignment: .leading) {
                    Text("Horizontal Grid")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    Text("Scrolls horizontally")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: [GridItem(.fixed(80)), GridItem(.fixed(80))], spacing: 15) {
                            ForEach(colors, id: \.self) { color in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(colors: [color.opacity(0.6), color], startPoint: .top, endPoint: .bottom))
                                    .frame(width: 120)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Grid Layouts")
    }
}

#Preview {
    NavigationView {
        GridLayoutView()
    }
}
