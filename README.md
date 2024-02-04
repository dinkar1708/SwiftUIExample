# SwiftUIExample

### SwiftUIExampleApp - run and press home button, tap home button again...
```
onChange scenePhase active
onChange scenePhase inactive
onChange scenePhase background
onChange scenePhase inactive
onChange scenePhase active
```

### AppDelegate - life cycle - clear app after run
```
AppDelegate willFinishLaunchingWithOptions
AppDelegate didFinishLaunchingWithOptions
onChange scenePhase active
active
onChange scenePhase inactive
inactive
onChange scenePhase background
background
AppDelegate applicationWillTerminate
```

### SceneDelegate - life cycle 
```
- press home button

AppDelegate willFinishLaunchingWithOptions
AppDelegate didFinishLaunchingWithOptions
SceneDelegate sceneWillEnterForeground
onChange scenePhase active
active
SceneDelegate sceneDidBecomeActive
onChange scenePhase inactive
inactive
SceneDelegate sceneWillResignActive
onChange scenePhase background
background
SceneDelegate sceneDidEnterBackground

- press app icon again...

onChange scenePhase inactive
inactive
SceneDelegate sceneWillEnterForeground
onChange scenePhase active
active
SceneDelegate sceneDidBecomeActive

```

## MemoryGraphView - Memory Leak Example with Strong References
This example demonstrates a memory leak involving strong references to a person and an apartment. Objects are visible in the graph, and memory is not properly cleaned up.
<img width="800" alt="Screen Shot 2021-09-21 at 12 11 04" src="https://user-images.githubusercontent.com/14831652/134106063-68ee9681-57fc-4c1d-9270-30bb7e835384.png">

## MemoryGraphWithoutLeakView - Memory Leak Solved with Weak References
Memory issues have been resolved by implementing weak references, ensuring proper memory cleanup. Objects are no longer visible in the graph.
<img width="800" alt="Screen Shot 2021-09-21 at 12 14 34" src="https://user-images.githubusercontent.com/14831652/134106233-7cc66011-946f-4f64-9005-686cb935272f.png">



