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
