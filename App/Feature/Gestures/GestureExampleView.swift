//
//  GestureExampleView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya
//

import SwiftUI

struct GestureExampleView: View {
    @State private var tapCount = 0
    @State private var isLongPressed = false
    @State private var dragOffset = CGSize.zero
    @State private var currentScale: CGFloat = 1.0

    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // Tap Gesture
                VStack {
                    Text("Tap Gesture")
                        .font(.headline)

                    Text("Taps: \(tapCount)")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .onTapGesture {
                            tapCount += 1
                        }

                    Button("Reset") {
                        tapCount = 0
                    }
                    .font(.caption)
                }

                Divider()

                // Long Press Gesture
                VStack {
                    Text("Long Press Gesture")
                        .font(.headline)

                    Circle()
                        .fill(isLongPressed ? Color.green : Color.gray)
                        .frame(width: 100, height: 100)
                        .scaleEffect(isLongPressed ? 1.2 : 1.0)
                        .animation(.spring(), value: isLongPressed)
                        .onLongPressGesture(minimumDuration: 1.0) {
                            isLongPressed.toggle()
                        }

                    Text(isLongPressed ? "Activated!" : "Hold for 1 second")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Divider()

                // Drag Gesture
                VStack {
                    Text("Drag Gesture")
                        .font(.headline)

                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.purple)
                        .frame(width: 120, height: 120)
                        .offset(dragOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    dragOffset = value.translation
                                }
                                .onEnded { _ in
                                    withAnimation(.spring()) {
                                        dragOffset = .zero
                                    }
                                }
                        )

                    Text("Drag me!")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Divider()

                // Pinch/Magnification Gesture
                VStack {
                    Text("Pinch Gesture")
                        .font(.headline)

                    Image(systemName: "photo")
                        .font(.system(size: 60))
                        .foregroundColor(.orange)
                        .scaleEffect(currentScale)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    currentScale = value
                                }
                                .onEnded { _ in
                                    withAnimation {
                                        currentScale = 1.0
                                    }
                                }
                        )

                    Text("Pinch to zoom (simulator: hold Option)")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
        }
        .navigationTitle("Gestures")
    }
}

#Preview {
    NavigationView {
        GestureExampleView()
    }
}
