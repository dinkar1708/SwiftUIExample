# SwiftUI Examples

[![Platform](https://img.shields.io/badge/Platform-iOS%20|%20macOS-blue.svg)](https://developer.apple.com/swift/)
[![Language](https://img.shields.io/badge/Language-Swift%205-orange.svg)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2014+-green.svg)](https://developer.apple.com/xcode/swiftui/)

A comprehensive collection of **29 SwiftUI examples** organized by difficulty level, demonstrating modern iOS development patterns and best practices. Perfect for learning SwiftUI from basics to advanced concepts.

## 🎯 What's Inside

This project contains **4 organized categories** with **29 working examples**:

- **Easy** (10 examples) - SwiftUI basics and fundamental UI components
- **Medium** (11 examples) - State management and clean code patterns
- **Advanced** (6 examples) - MVVM architecture and advanced patterns
- **Training** (2 examples) - Simple training exercises

Plus **11 Feature examples** covering UI components, animations, and memory management.

## Screens
<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 18 12" src="https://github.com/user-attachments/assets/bba4042e-e87d-4035-b800-744605b75810" />
<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 18 37" src="https://github.com/user-attachments/assets/e7379634-c115-45da-8d6f-113a7f7760ec" />

<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 18 40" src="https://github.com/user-attachments/assets/a2214217-62c0-4da5-8312-05cc3735dacb" />
<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 18 44" src="https://github.com/user-attachments/assets/8f278885-66bb-4d43-ab5d-d534e796507d" />

<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 18 47" src="https://github.com/user-attachments/assets/99fa5209-ac67-4f09-8e8c-d0c28afb1f09" />


<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 18 50" src="https://github.com/user-attachments/assets/89ef395f-5565-4088-a439-fdd92ec29455" />

<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 18 53" src="https://github.com/user-attachments/assets/93aafe9a-1c24-41df-8164-595241745df1" />
<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 19 00" src="https://github.com/user-attachments/assets/f3eaf32c-0a65-4dea-a0c8-e65bf6ffc811" />
<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 19 07" src="https://github.com/user-attachments/assets/e7804054-ae0d-4a24-85fb-0a7c6cbb6ab8" />
<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 19 15" src="https://github.com/user-attachments/assets/645a734f-51e8-41e1-a61a-8d81efed6bd3" />

<img width="400" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 19 21" src="https://github.com/user-attachments/assets/9ef23a2d-7f93-413e-9881-e2b9d98f2c25" />

## 📱 Navigation Structure

The app features a **dual navigation system** for easy access to all examples:

### Option 1: Browse All Examples (Organized by Difficulty)
Tap "Browse All Examples" on the home screen to access categorized examples:

**Easy Examples (10)**
- Home View, View Life Cycle, Stack Examples, Spacer Examples
- UI Elements, SF Symbols, System Environment
- Color Examples, View Modifiers, Simple Animations

**Medium Examples (11)**
- State, Binding, Observable Object, Environment Object
- Custom Environment, View Builder Tips
- Size Classes (Width & Height)
- Clean Code (Functions, Variables, Extensions)

**Advanced Examples (6)**
- MVVM Example, Geometry Reader, Navigation Link
- ScrollView & LazyVStack, View Builder Custom, Extension on AnyView

**Training Examples (2)**
- Simple Zoom Animation, Home View (Basic)

### Option 2: Direct Access (Quick Feature Testing)
Scroll through categorized sections on the home screen:
- **User Interface** - Lists, Forms, Grids, Tab Views, Modal Sheets
- **Interactions** - Animations, Gestures
- **Data & State** - State Management, Async/Await
- **Memory Management** - Memory Leak Demo, Fixed Memory Demo

## 💡 What You Will Learn

This project contains real working examples of SwiftUI features you will use in production apps. Each example is interactive and includes detailed explanations.

Modal sheets and presentation styles are covered in the Modal Sheet demo. You can see how to present sheets with different sizes and how to use the modern toolbar API for navigation items.

Memory management is demonstrated through two examples showing the difference between memory leaks and proper memory cleanup. The examples use visual cards and interactive buttons so you can actually trigger memory leaks and see how weak references fix them.

App lifecycle tracking shows you how SwiftUI apps respond to being backgrounded and foregrounded. The console logs show exactly when each phase change happens.

Navigation with NavigationStack demonstrates the modern iOS navigation system. The home screen uses a List with NavigationLinks to navigate between different examples.

## 🚀 Key Features

### UI Components & Layouts
- **Lists & ForEach** - Dynamic lists with CRUD operations
- **Forms & Input** - Text fields, toggles, pickers
- **Grid Layouts** - Adaptive, fixed, and flexible grids
- **Tab Views** - Bottom tab navigation pattern
- **Modal Sheets** - Present views with custom sizes using presentationDetents

### Animations & Interactions
- **Animations** - Rotation, scale, slide, fade, bounce effects
- **Gestures** - Tap, long press, drag, pinch gestures
- **State Management** - @State, @Binding, @ObservableObject patterns

### Advanced Patterns
- **MVVM Architecture** - Clean separation of concerns
- **Async/Await** - Modern networking patterns (iOS 15+)
- **Custom View Builders** - Reusable component patterns
- **Geometry Reader** - Dynamic layouts based on size

### Memory Management (Critical for Production)
- **Memory Leak Example** - Demonstrates strong reference cycles and retain cycles
- **Fixed Memory Example** - Shows proper weak reference usage and cleanup
- **Visual Debugging** - Step-by-step instructions for Xcode memory graph tool

## Modern iOS Features Used

The code has been updated to use the latest iOS APIs and best practices:

NavigationStack instead of the old NavigationView. This is the modern navigation container introduced in iOS 16.

Toolbar API replaces the deprecated navigationBarItems. Toolbar items are placed using semantic placements like confirmationAction and cancellationAction.

Environment dismiss property replaces presentation mode for dismissing sheets. This is cleaner and more SwiftUI native.

onChange modifier with two parameters gives you both the old and new values. This is the iOS 17 update to onChange.

Presentation detents allow you to create sheets that show at medium or large heights. Users can drag to resize them.

Modern date formatting uses the formatted method instead of DateFormatter.

Label views combine icons and text in a standard iOS pattern.

## 📋 Requirements

- iOS 14.0+ / macOS 11.0+
- Xcode 14.0+
- Swift 5.0+

The code uses modern SwiftUI APIs while maintaining backwards compatibility where possible.

## 🏃 Quick Start

```bash
# Clone the repository
git clone https://github.com/dinkar1708/SwiftUIExample.git
cd SwiftUIExample

# Open in Xcode
open SwiftUIExample.xcodeproj

# Build and run
# Select iOS simulator or your device
# Press Cmd+R to run
```

### First Launch
1. App launches with the main navigation screen
2. Tap **"Browse All Examples"** to see all 29 examples organized by difficulty
3. Or scroll down to access specific features directly
4. Each example is self-contained with clear UI instructions

## Understanding App Lifecycle

The app demonstrates how iOS apps transition between different states. When you run the app and press the home button, watch the Xcode console to see the phase changes.

Active phase means your app is in the foreground and receiving events. Inactive phase is a brief transition state when entering or leaving the foreground. Background phase means your app is not visible and should minimize its work.

The onChange modifier in SwiftUIExampleApp tracks these changes. This is useful for saving state, pausing work, or cleaning up resources.

## Memory Management Deep Dive

Understanding memory management is critical for building apps that do not leak memory and crash.

The Memory Leak Example creates two objects that reference each other with strong references. Even when you set both objects to nil, they stay in memory because they are keeping each other alive. This is called a retain cycle or strong reference cycle.

The Fixed Memory Example breaks the cycle by making one reference weak. A weak reference does not increase the retain count so objects can be deallocated normally. You can see this working by checking the console for deinit messages.

To see the memory graph yourself, run the app and tap the Create Memory Leak button. Then in Xcode press Command 7 to open the Debug Navigator. Click the memory graph icon at the bottom. You will see Person and Apartment instances still in memory. Now switch to the Fixed example and you will see the objects are properly cleaned up.

## 📁 Project Structure

```
SwiftUIExample/
├── App/
│   ├── Configuration/          # App entry point
│   │   ├── SwiftUIExampleApp.swift    # Main App + ContentView
│   │   ├── AppDelegate.swift
│   │   └── SceneDelegate.swift
│   ├── Examples/               # Categorized examples
│   │   ├── ExamplesMainView.swift     # Main category browser
│   │   ├── Easy/              # 10 basic examples
│   │   ├── Medium/            # 11 intermediate examples
│   │   └── Advance/           # 6 advanced examples
│   ├── Feature/               # Feature-specific demos
│   │   ├── Animations/
│   │   ├── Gestures/
│   │   ├── Lists/
│   │   ├── Forms/
│   │   ├── GridLayouts/
│   │   ├── TabViews/
│   │   ├── Modal/
│   │   ├── StateManagement/
│   │   ├── AsyncAwait/
│   │   └── MemoryGraph/       # Memory management demos
│   └── Assets.xcassets/       # Images and colors
└── README.md
```

Each view file includes:
- ✅ Self-contained example code
- ✅ SwiftUI Preview for Xcode canvas
- ✅ Clear comments and explanations

## 🎓 Learning Path

### For Beginners (Start Here)
1. **Easy Category** → Browse All Examples → Easy
   - Start with "Home View" and "Stack Examples"
   - Learn basic layouts with VStack, HStack, ZStack
   - Understand spacing and padding

2. **UI Elements** → Explore buttons, text fields, images
3. **Simple Animations** → See basic SwiftUI animations

### For Intermediate Developers
1. **Medium Category** → State management examples
   - @State, @Binding, @ObservableObject patterns
   - Environment objects and custom environment values

2. **User Interface Features** → Lists, Forms, Grids, Tab Views
3. **Interactions** → Animations and Gestures

### For Advanced Developers
1. **Advanced Category** → MVVM architecture patterns
2. **Memory Management** → Critical for production apps
   - Study Memory Leak example first
   - Compare with Fixed Memory example
   - Use Xcode Memory Graph (Cmd+7) to visualize

3. **Async/Await** → Modern networking (iOS 15+)

### Pro Tips
- ✅ Run the app with Console visible (Cmd+Shift+C) to see lifecycle events
- ✅ Use Xcode Canvas previews for rapid iteration
- ✅ Study the Memory Graph tool for debugging retain cycles
- ✅ Read code comments for detailed explanations

## 🔑 Key SwiftUI Patterns Demonstrated

### State Management
- `@State` - For local view state
- `@Binding` - For two-way data flow
- `@ObservableObject` - For shared data models
- `@EnvironmentObject` - For app-wide state
- Custom Environment values

### UI Patterns
- Declarative layouts with VStack, HStack, ZStack
- Modern NavigationStack and NavigationLink (iOS 16+)
- List with dynamic content and CRUD operations
- Forms with validation patterns
- Adaptive grids (LazyVGrid, LazyHGrid)

### Advanced Techniques
- MVVM architecture separation
- Custom ViewBuilder components
- GeometryReader for dynamic layouts
- View modifiers for reusable styling
- Toolbar with semantic placements

### Production-Ready Code
- Proper memory management (weak references)
- App lifecycle tracking (scenePhase)
- Async/await for networking
- Error handling patterns
- Clean code organization

## 📊 Example Count by Category

| Category | Count | Difficulty |
|----------|-------|------------|
| Easy Examples | 10 | ⭐ Beginner |
| Medium Examples | 11 | ⭐⭐ Intermediate |
| Advanced Examples | 6 | ⭐⭐⭐ Advanced |
| Training Examples | 2 | ⭐ Learning |
| Feature Demos | 11 | ⭐⭐ Various |
| **Total** | **40** | All Levels |

## Screenshots

<img width="800" alt="Screen Shot 2021-09-21 at 12 11 04" src="https://user-images.githubusercontent.com/14831652/134106063-68ee9681-57fc-4c1d-9270-30bb7e835384.png">

Memory leak visualization showing objects remaining in memory due to strong reference cycle.

<img width="800" alt="Screen Shot 2021-09-21 at 12 14 34" src="https://user-images.githubusercontent.com/14831652/134106233-7cc66011-946f-4f64-9005-686cb935272f.png">

Fixed memory management with weak references allowing proper deallocation.



