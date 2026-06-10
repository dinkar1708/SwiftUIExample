# SwiftUI Examples

A collection of practical SwiftUI examples demonstrating common iOS development patterns and best practices. This project is perfect for learning SwiftUI fundamentals and understanding important iOS concepts like memory management and app lifecycle.

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

<img width="1170" height="900" alt="Simulator Screenshot - iPhone 17e - 2026-06-10 at 17 19 21" src="https://github.com/user-attachments/assets/9ef23a2d-7f93-413e-9881-e2b9d98f2c25" />

## What You Will Learn

This project contains real working examples of SwiftUI features you will use in production apps. Each example is interactive and includes detailed explanations right in the UI.

Modal sheets and presentation styles are covered in the Modal Sheet demo. You can see how to present sheets with different sizes and how to use the modern toolbar API for navigation items.

Memory management is demonstrated through two examples showing the difference between memory leaks and proper memory cleanup. The examples use visual cards and interactive buttons so you can actually trigger memory leaks and see how weak references fix them.

App lifecycle tracking shows you how SwiftUI apps respond to being backgrounded and foregrounded. The console logs show exactly when each phase change happens.

Navigation with NavigationStack demonstrates the modern iOS navigation system. The home screen uses a List with NavigationLinks to navigate between different examples.

## Features

The app includes three main examples you can explore:

Modal Sheet Demo shows how to present modal views with the latest iOS APIs. You can see a detail sheet with toolbar buttons and a date picker sheet with custom presentation sizes. The date picker sheet uses presentationDetents to show medium and large size options.

Memory Leak Example demonstrates what happens when you create a strong reference cycle. Two objects hold strong references to each other and never get deallocated. The UI explains the problem clearly and gives you step by step instructions to view the memory graph in Xcode.

Fixed Memory Example shows the correct way to handle object relationships. One object uses a weak reference to break the cycle. When you tap the test button, you can see in the console that deinit methods are called properly.

## Modern iOS Features Used

The code has been updated to use the latest iOS APIs and best practices:

NavigationStack instead of the old NavigationView. This is the modern navigation container introduced in iOS 16.

Toolbar API replaces the deprecated navigationBarItems. Toolbar items are placed using semantic placements like confirmationAction and cancellationAction.

Environment dismiss property replaces presentation mode for dismissing sheets. This is cleaner and more SwiftUI native.

onChange modifier with two parameters gives you both the old and new values. This is the iOS 17 update to onChange.

Presentation detents allow you to create sheets that show at medium or large heights. Users can drag to resize them.

Modern date formatting uses the formatted method instead of DateFormatter.

Label views combine icons and text in a standard iOS pattern.

## Requirements

iOS 14.0 or later
Xcode 14 or later

The code uses the latest SwiftUI APIs but maintains backwards compatibility where possible.

## How to Run

Open SwiftUIExample.xcodeproj in Xcode. Select any iOS simulator or your device from the scheme picker. Press Command R to build and run the app.

When the app launches you will see a list of examples. Tap any row to explore that example. Each example is self contained and includes instructions right in the UI.

## Understanding App Lifecycle

The app demonstrates how iOS apps transition between different states. When you run the app and press the home button, watch the Xcode console to see the phase changes.

Active phase means your app is in the foreground and receiving events. Inactive phase is a brief transition state when entering or leaving the foreground. Background phase means your app is not visible and should minimize its work.

The onChange modifier in SwiftUIExampleApp tracks these changes. This is useful for saving state, pausing work, or cleaning up resources.

## Memory Management Deep Dive

Understanding memory management is critical for building apps that do not leak memory and crash.

The Memory Leak Example creates two objects that reference each other with strong references. Even when you set both objects to nil, they stay in memory because they are keeping each other alive. This is called a retain cycle or strong reference cycle.

The Fixed Memory Example breaks the cycle by making one reference weak. A weak reference does not increase the retain count so objects can be deallocated normally. You can see this working by checking the console for deinit messages.

To see the memory graph yourself, run the app and tap the Create Memory Leak button. Then in Xcode press Command 7 to open the Debug Navigator. Click the memory graph icon at the bottom. You will see Person and Apartment instances still in memory. Now switch to the Fixed example and you will see the objects are properly cleaned up.

## Project Structure

The code is organized into logical groups:

Configuration folder has the app entry point and delegate files. SwiftUIExampleApp is the main App struct. AppDelegate and SceneDelegate are included for apps that need UIKit integration.

Feature folder contains each example organized by purpose. MemoryGraph contains the memory management examples. Modal contains the sheet presentation examples.

Each view file is self contained with its own preview provider so you can preview it in Xcode canvas.

## Tips for Learning

Start with the Modal Sheet example to see basic SwiftUI patterns. Look at how state variables control sheet presentation. Notice how the Environment dismiss property works.

Then explore the memory examples to understand reference counting. Read the comments in MemoryGraphModel.swift to see the difference between strong and weak references.

Run the app with the console visible to see all the print statements. These show you exactly when objects are created and destroyed.

Use the Xcode memory graph tool to visualize object relationships. This is an essential debugging skill for iOS development.

## Common Patterns Demonstrated

State management with State and Binding properties. The modal examples show how to toggle boolean state to present sheets.

Environment values like dismiss and scenePhase. These are SwiftUI's way to access system provided values.

Declarative UI layout with VStack, HStack, and spacing parameters. All the examples use standard SwiftUI layout containers.

Modern navigation with NavigationStack and NavigationLink. The home screen shows the recommended iOS 16 approach.

Toolbar customization with semantic placements. The detail view shows how to add cancel and save buttons properly.

View modifiers for styling like padding, background, and cornerRadius. Every example uses these to create polished UI.

## Screenshots

<img width="800" alt="Screen Shot 2021-09-21 at 12 11 04" src="https://user-images.githubusercontent.com/14831652/134106063-68ee9681-57fc-4c1d-9270-30bb7e835384.png">

Memory leak visualization showing objects remaining in memory due to strong reference cycle.

<img width="800" alt="Screen Shot 2021-09-21 at 12 14 34" src="https://user-images.githubusercontent.com/14831652/134106233-7cc66011-946f-4f64-9005-686cb935272f.png">

Fixed memory management with weak references allowing proper deallocation.



