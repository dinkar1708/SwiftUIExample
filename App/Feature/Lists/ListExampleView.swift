//
//  ListExampleView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya
//

import SwiftUI

struct FruitItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let emoji: String
    let color: Color
}

struct ListExampleView: View {
    @State private var items = [
        FruitItem(name: "Apple", emoji: "🍎", color: .red),
        FruitItem(name: "Banana", emoji: "🍌", color: .yellow),
        FruitItem(name: "Cherry", emoji: "🍒", color: .pink),
        FruitItem(name: "Grapes", emoji: "🍇", color: .purple),
        FruitItem(name: "Watermelon", emoji: "🍉", color: .green)
    ]
    @State private var newItemName = ""
    @State private var showingAddSheet = false

    let emojis = ["🍎", "🍌", "🍒", "🍇", "🍉", "🍊", "🍋", "🍓", "🥝", "🥑"]
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, Color(red: 0.4, green: 0.9, blue: 0.7)]

    var body: some View {
        ZStack {
            if items.isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "list.bullet.rectangle")
                        .font(.system(size: 70))
                        .foregroundStyle(.gray.opacity(0.5))

                    Text("No Items Yet")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)

                    Text("Tap the + button to add your first item")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
            } else {
                List {
                    ForEach(items) { item in
                        HStack(spacing: 16) {
                            Text(item.emoji)
                                .font(.system(size: 40))
                                .frame(width: 60, height: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(item.color.opacity(0.2))
                                )

                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.name)
                                    .font(.headline)

                                Text("Tap to view details")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 8)
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("List & ForEach")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddSheet = true }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                }
            }

            ToolbarItem(placement: .navigationBarLeading) {
                if !items.isEmpty {
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            NavigationView {
                VStack(spacing: 30) {
                    Text("Add New Item")
                        .font(.title2)
                        .fontWeight(.bold)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Item Name")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        TextField("Enter item name", text: $newItemName)
                            .textFieldStyle(.roundedBorder)
                            .font(.body)
                    }
                    .padding(.horizontal)

                    Button(action: addItem) {
                        Text("Add Item")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(newItemName.isEmpty ? Color.gray : Color.blue)
                            )
                    }
                    .disabled(newItemName.isEmpty)
                    .padding(.horizontal)

                    Spacer()
                }
                .padding(.top, 30)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Cancel") {
                            showingAddSheet = false
                            newItemName = ""
                        }
                    }
                }
            }
            .presentationDetents([.medium])
        }
        .overlay(alignment: .bottom) {
            if !items.isEmpty {
                HStack {
                    Image(systemName: "info.circle")
                        .foregroundColor(.blue)
                    Text("Swipe left to delete • Long press to reorder")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding()
            }
        }
    }

    private func addItem() {
        guard !newItemName.isEmpty else { return }
        let randomEmoji = emojis.randomElement() ?? "🎯"
        let randomColor = colors.randomElement() ?? .blue
        let newItem = FruitItem(name: newItemName, emoji: randomEmoji, color: randomColor)
        withAnimation {
            items.append(newItem)
        }
        newItemName = ""
        showingAddSheet = false
    }

    private func deleteItems(at offsets: IndexSet) {
        withAnimation {
            items.remove(atOffsets: offsets)
        }
    }

    private func moveItems(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    NavigationView {
        ListExampleView()
    }
}
