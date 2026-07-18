//
//  ExamplesMainView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya
//

import SwiftUI

struct CategoryRow: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let count: Int

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(LinearGradient(colors: [color.opacity(0.7), color], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 60, height: 60)
                    .shadow(color: color.opacity(0.3), radius: 8, x: 0, y: 4)

                Image(systemName: icon)
                    .font(.system(size: 28))
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("\(count) examples")
                    .font(.caption)
                    .foregroundColor(color)
                    .fontWeight(.medium)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
                .font(.footnote)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
        )
    }
}

struct ExamplesMainView: View {
    var body: some View {
        ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 12) {
                        Image(systemName: "swift")
                            .font(.system(size: 60))
                            .foregroundColor(.orange)

                        Text("SwiftUI Examples")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Learn SwiftUI from basic to advanced")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 20)

                    // Easy Examples
                    NavigationLink(destination: EasyExamplesListView()) {
                        CategoryRow(
                            title: "Easy",
                            subtitle: "Basic SwiftUI components and layouts",
                            icon: "star.fill",
                            color: .green,
                            count: 10
                        )
                    }
                    .buttonStyle(PlainButtonStyle())

                    // Medium Examples
                    NavigationLink(destination: MediumExamplesListView()) {
                        CategoryRow(
                            title: "Medium",
                            subtitle: "State management and clean code",
                            icon: "flame.fill",
                            color: .orange,
                            count: 11
                        )
                    }
                    .buttonStyle(PlainButtonStyle())

                    // Advanced Examples
                    NavigationLink(destination: AdvancedExamplesListView()) {
                        CategoryRow(
                            title: "Advanced",
                            subtitle: "MVVM, custom views, and patterns",
                            icon: "crown.fill",
                            color: .purple,
                            count: 6
                        )
                    }
                    .buttonStyle(PlainButtonStyle())

                    // Training Examples
                    NavigationLink(destination: TrainingExamplesListView()) {
                        CategoryRow(
                            title: "Training",
                            subtitle: "Simple training examples",
                            icon: "graduationcap.fill",
                            color: Color(red: 0.2, green: 0.6, blue: 0.9),
                            count: 2
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("SwiftUI Examples")
            .navigationBarTitleDisplayMode(.large)
    }
}

// Easy Examples List
struct EasyExamplesListView: View {
    var body: some View {
        List {
            NavigationLink("Home View", destination: HomeView())
            NavigationLink("View Life Cycle", destination: ViewLifeCycleView())
            NavigationLink("Stack Examples", destination: StackExampleView())
            NavigationLink("Spacer Examples", destination: SpacerExampleView())
            NavigationLink("UI Elements", destination: UIElementsExampleView())
            NavigationLink("SF Symbols", destination: SFSymbolsExampleView())
            NavigationLink("System Environment", destination: SystemEnvironmentExampleView())
            NavigationLink("Color Examples", destination: ColorExampleView())
            NavigationLink("View Modifiers", destination: ViewModifierExampleView())
        }
        .navigationTitle("Easy Examples")
    }
}

// Medium Examples List
struct MediumExamplesListView: View {
    var body: some View {
        List {
            NavigationLink("State Example", destination: StateExampleView())
            NavigationLink("Binding Example", destination: BindingExampleView())
            NavigationLink("Observable Object", destination: ObservableObjectExampleView())
            NavigationLink("Environment Object", destination: EnvironmentObjectExampleView())
            NavigationLink("Custom Environment", destination: CustomEnvironmentValueView())
            NavigationLink("View Builder Tips", destination: ViewBuilderTipsView())
            NavigationLink("Size Classes (Width)", destination: WidthSizeClassesView())
            NavigationLink("Size Classes (Height)", destination: HeightSizeClassesView())
            NavigationLink("Clean Code (Functions)", destination: CleanCodeViewFunction())
            NavigationLink("Clean Code (Variables)", destination: CleanCodeViewVariable())
            NavigationLink("Clean Code (Extensions)", destination: CleanCodeViewUsingExtension())
        }
        .navigationTitle("Medium Examples")
    }
}

// Advanced Examples List
struct AdvancedExamplesListView: View {
    var body: some View {
        List {
            NavigationLink("MVVM Example", destination: MVVMExampleView())
            NavigationLink("Geometry Reader", destination: GeometryReaderView())
            NavigationLink("Navigation Link", destination: NavigationLinkExampleView())
            NavigationLink("ScrollView & LazyVStack", destination: ScrollViewLazyVStackView())
            NavigationLink("View Builder Custom", destination: ViewBuilderCustomView())
            NavigationLink("Extension on AnyView", destination: ExtensionOnAnyView())
        }
        .navigationTitle("Advanced Examples")
    }
}

// Training Examples List
struct TrainingExamplesListView: View {
    var body: some View {
        List {
            NavigationLink("Simple Zoom Animation", destination: SimpleZoomAnimationView())
            NavigationLink("Home View (Basic)", destination: HomeView())
        }
        .navigationTitle("Training Examples")
    }
}

#Preview {
    ExamplesMainView()
}
