//
//  AnimationExampleView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya
//

import SwiftUI

struct AnimationCard: View {
    let title: String
    let description: String
    let color: Color
    let content: AnyView
    let buttonText: String
    let action: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 8) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }

            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(color.opacity(0.1))
                    .frame(height: 180)

                content
            }

            Button(action: action) {
                Text(buttonText)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(LinearGradient(colors: [color.opacity(0.8), color], startPoint: .leading, endPoint: .trailing))
                    )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}

struct AnimationExampleView: View {
    @State private var isRotated = false
    @State private var isScaled = false
    @State private var offset: CGFloat = 0
    @State private var opacity: Double = 1.0
    @State private var showBounce = false

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Header
                VStack(spacing: 12) {
                    Image(systemName: "wand.and.stars")
                        .font(.system(size: 50))
                        .foregroundColor(.purple)

                    Text("SwiftUI Animations")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Tap the buttons to see different animation effects")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                .padding(.horizontal)

                // Rotation Animation
                AnimationCard(
                    title: "Rotation",
                    description: "Smooth rotation with easeInOut timing",
                    color: .blue,
                    content: AnyView(
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .font(.system(size: 70))
                            .foregroundColor(.blue)
                            .rotationEffect(.degrees(isRotated ? 360 : 0))
                            .animation(.easeInOut(duration: 1.0), value: isRotated)
                    ),
                    buttonText: isRotated ? "Reset Rotation" : "Start Rotation",
                    action: {
                        isRotated.toggle()
                    }
                )
                .padding(.horizontal)

                // Scale Animation
                AnimationCard(
                    title: "Spring Scale",
                    description: "Bouncy spring animation with physics",
                    color: .green,
                    content: AnyView(
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.green, Color(red: 0.4, green: 0.9, blue: 0.7)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 90, height: 90)
                            .scaleEffect(isScaled ? 1.4 : 1.0)
                            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: isScaled)
                    ),
                    buttonText: isScaled ? "Scale Down" : "Scale Up",
                    action: {
                        isScaled.toggle()
                    }
                )
                .padding(.horizontal)

                // Slide Animation
                AnimationCard(
                    title: "Slide",
                    description: "Smooth horizontal movement",
                    color: .orange,
                    content: AnyView(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(
                                LinearGradient(
                                    colors: [.orange, .yellow],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: 100, height: 70)
                            .offset(x: offset)
                            .animation(.easeInOut(duration: 0.8), value: offset)
                    ),
                    buttonText: offset == 0 ? "Slide Right" : "Slide Left",
                    action: {
                        offset = offset == 0 ? 80 : 0
                    }
                )
                .padding(.horizontal)

                // Opacity Animation
                AnimationCard(
                    title: "Fade",
                    description: "Smooth opacity transition",
                    color: .pink,
                    content: AnyView(
                        Image(systemName: "star.fill")
                            .font(.system(size: 70))
                            .foregroundColor(.pink)
                            .opacity(opacity)
                            .animation(.easeInOut(duration: 1.0), value: opacity)
                    ),
                    buttonText: opacity == 1.0 ? "Fade Out" : "Fade In",
                    action: {
                        opacity = opacity == 1.0 ? 0.2 : 1.0
                    }
                )
                .padding(.horizontal)

                // Bounce Animation
                AnimationCard(
                    title: "Bounce",
                    description: "Bouncy vertical animation",
                    color: .purple,
                    content: AnyView(
                        Image(systemName: "basketball.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.orange)
                            .offset(y: showBounce ? -40 : 0)
                            .animation(
                                showBounce ?
                                    .interpolatingSpring(stiffness: 200, damping: 5).repeatForever(autoreverses: true) :
                                    .default,
                                value: showBounce
                            )
                    ),
                    buttonText: showBounce ? "Stop Bounce" : "Start Bounce",
                    action: {
                        showBounce.toggle()
                    }
                )
                .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
        .navigationTitle("Animations")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    NavigationView {
        AnimationExampleView()
    }
}
